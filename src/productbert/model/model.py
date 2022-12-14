import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F
from base import BaseModel
from transformers import BertModel
from transformers.modeling_bert import BertOnlyMLMHead
from torch.cuda.amp import autocast
from torch.nn.utils.rnn import pad_sequence

class JointBERT_S(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        index_sep = np.array([[i, seq[i].tolist().index(102)] for i in range(len(seq))])
        sep_output = temp[index_sep[:, 0], index_sep[:, 1]]

        # Feeding cls_rep to the classifier layer
        logits_binary = self.cls_layer(pooler_output)
        logits_multi1 = self.multi1_cls_layer(pooler_output)
        logits_multi2 = self.multi2_cls_layer(sep_output)

        multi1 = self.multi_softmax(logits_multi1)
        multi2 = self.multi_softmax(logits_multi2)

        return logits_binary, multi1, multi2

### AOA
class EMBA(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])
            # sent1_emb.append(torch.unsqueeze(temp[i][1:lst_seq1_ind][:], 0))
            # sent2_emb.append(torch.unsqueeze(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:], 0))

        batched_main = []
        res_multi1 = []
        res_multi2 = []
        for j in range(len(seq)):
            interaction_mat = torch.matmul(torch.unsqueeze(sent1_emb[j], 0), torch.transpose(torch.unsqueeze(sent2_emb[j], 0), 1, 2)) 
            alpha = F.softmax(interaction_mat, dim=1) 
            beta = F.softmax(interaction_mat, dim=2) 
            beta_avg = beta.mean(dim=1, keepdim=True) 
            gamma = torch.matmul(alpha, beta_avg.transpose(1, 2))
            weighted_sum = torch.matmul(torch.transpose(torch.unsqueeze(sent1_emb[j], 0), 1, 2), gamma).squeeze(-1) 
            # weighted_sum += emb_st1
            logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb[j], 0))
            logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb[j], 0))
            res_multi1.append(logits_multi1)
            res_multi2.append(logits_multi2)
            batched_main.append(torch.squeeze(weighted_sum) + pooler_output[j])
        logits_binary = self.cls_layer(torch.stack(batched_main))
        multi1_t = torch.stack(res_multi1)
        multi2_t = torch.stack(res_multi2)
        multi1 = self.multi_softmax(multi1_t)
        multi2 = self.multi_softmax(multi2_t)

        return logits_binary, multi1, multi2


## ABL
class EMBA_CLS(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])
            # sent1_emb.append(torch.unsqueeze(temp[i][1:lst_seq1_ind][:], 0))
            # sent2_emb.append(torch.unsqueeze(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:], 0))

        batched_main = []
        res_multi1 = []
        res_multi2 = []
        for j in range(len(seq)):
            interaction_mat = torch.matmul(torch.unsqueeze(sent1_emb[j], 0), torch.transpose(torch.unsqueeze(sent2_emb[j], 0), 1, 2)) 
            alpha = F.softmax(interaction_mat, dim=1) 
            beta = F.softmax(interaction_mat, dim=2) 
            beta_avg = beta.mean(dim=1, keepdim=True) 
            gamma = torch.matmul(alpha, beta_avg.transpose(1, 2))
            weighted_sum = torch.matmul(torch.transpose(torch.unsqueeze(sent1_emb[j], 0), 1, 2), gamma).squeeze(-1) 
            # weighted_sum += emb_st1
            # logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb[j], 0))
            # logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb[j], 0))
            # res_multi1.append(logits_multi1)
            # res_multi2.append(logits_multi2)
            batched_main.append(torch.squeeze(weighted_sum) + pooler_output[j])
        logits_binary = self.cls_layer(torch.stack(batched_main))
        logits_multi1 = self.multi1_cls_layer(pooler_output)
        logits_multi2 = self.multi2_cls_layer(pooler_output)
        multi1 = self.multi_softmax(logits_multi1)
        multi2 = self.multi_softmax(logits_multi2)

        return logits_binary, multi1, multi2

# # ABL no aoa but average token

class JointBERT_T(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])
            # sent1_emb.append(torch.unsqueeze(temp[i][1:lst_seq1_ind][:], 0))
            # sent2_emb.append(torch.unsqueeze(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:], 0))

        batched_main = []
        res_multi1 = []
        res_multi2 = []
        for j in range(len(seq)):
            logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb[j], 0))
            logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb[j], 0))
            res_multi1.append(logits_multi1)
            res_multi2.append(logits_multi2)
            batched_main.append((torch.mean(sent1_emb[j], 0) + torch.mean(sent2_emb[j], 0))/2)
        logits_binary = self.cls_layer(torch.stack(batched_main))
        multi1_t = torch.stack(res_multi1)
        multi2_t = torch.stack(res_multi2)
        multi1 = self.multi_softmax(multi1_t)
        multi2 = self.multi_softmax(multi2_t)

        return logits_binary, multi1, multi2

# # ABL no aoa but average token and cls for entity matching

class JointBERT_CT(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])
            # sent1_emb.append(torch.unsqueeze(temp[i][1:lst_seq1_ind][:], 0))
            # sent2_emb.append(torch.unsqueeze(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:], 0))

        batched_main = []
        res_multi1 = []
        res_multi2 = []
        for j in range(len(seq)):
            logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb[j], 0))
            logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb[j], 0))
            res_multi1.append(logits_multi1)
            res_multi2.append(logits_multi2)
            # batched_main.append((torch.mean(sent1_emb[j], 0) + torch.mean(sent2_emb[j], 0))/2)
        # logits_binary = self.cls_layer(torch.stack(batched_main))
        logits_binary = self.cls_layer(pooler_output)
        multi1_t = torch.stack(res_multi1)
        multi2_t = torch.stack(res_multi2)
        multi1 = self.multi_softmax(multi1_t)
        multi2 = self.multi_softmax(multi2_t)

        return logits_binary, multi1, multi2


# # SurfCon implementation

class EMBA_SurfCon(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.do_ctx_interact = True
        self.context_gamma = 0.3
        self.dropout = nn.Dropout(0)
        self.context_dim = 768
        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        self.bi_c = nn.Bilinear(self.context_dim, self.context_dim, 1, bias=True)

        self.att_mat = nn.Parameter(torch.Tensor(self.context_dim, self.context_dim))
        initrange = 0.5 / self.context_dim
        nn.init.uniform_(self.att_mat, -initrange, initrange)

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(1, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    def _pairwise_interaction(self, mat_A, mat_B):
            # mat_A: (W, D), mat_B: (V, D)
            dim_A = mat_A.shape[0]
            dim_B = mat_B.shape[0]

            mat_sim = torch.matmul(torch.matmul(mat_A, self.att_mat), torch.t(mat_B))
            mat_sim = torch.tanh(mat_sim)

            rows = F.softmax(torch.mean(mat_sim, dim=1), dim=0).reshape(-1, 1)
            cols = F.softmax(torch.mean(mat_sim, dim=0), dim=0).reshape(-1, 1)

            new_A = torch.sum(mat_A * rows, dim=0, keepdim=True)
            new_B = torch.sum(mat_B * cols, dim=0, keepdim=True)
            return new_A, new_B

    def _list_context_vector(self, t1_context, t2s_contexts):
        if type(t1_context) != torch.Tensor:
            t1_context = torch.tensor(t1_context)
            if torch.cuda.is_available():
                t1_context = t1_context.cuda()

        # t1_context = self.context_features(t1_context)  # (W, dim for node embedding - D2)

        t2_context = t2s_contexts
        if type(t2_context) != torch.Tensor:
            t2_context = torch.tensor(t2_context)  # (context size for t2 - V, M2)
            if torch.cuda.is_available():
                t2_context = t2_context.cuda()

        # t2_context = self.context_features(t2_context)  # (V, D2)

        # pairwise interaction
        if self.do_ctx_interact:
            t1_context_vec, t2_context_vec = self._pairwise_interaction(t1_context, t2_context)
        else:
            t1_context_vec = torch.mean(t1_context, dim=0, keepdim=True)  # (1, 128)
            t2_context_vec = torch.mean(t2_context, dim=0, keepdim=True)  # (1, 128)
            # print(t1_context_vec.shape, t2_context_vec.shape)

        # t1_context_vecs = torch.cat(t1_context_vecs, dim=0)
        # t2_context_vecs = torch.cat(t2_context_vecs, dim=0)  # (N, word dim)
        return t1_context_vec, t2_context_vec

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])
            # sent1_emb.append(torch.unsqueeze(temp[i][1:lst_seq1_ind][:], 0))
            # sent2_emb.append(torch.unsqueeze(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:], 0))

        batched_main = []
        res_multi1 = []
        res_multi2 = []
        for j in range(len(seq)):
            str_score = F.cosine_similarity(torch.unsqueeze(torch.mean(sent1_emb[j], 0), 0), torch.unsqueeze(torch.mean(sent2_emb[j], 0), 0))
            ctx_t1s, ctx_t2s = self._list_context_vector(sent1_emb[j], sent2_emb[j])
            con_score = self.bi_c(ctx_t1s, ctx_t2s)
            str_score = str_score.reshape(-1)
            con_score = con_score.reshape(-1)
            y = ((1 - self.context_gamma) * str_score + self.context_gamma * con_score)
            logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb[j], 0))
            logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb[j], 0))
            res_multi1.append(logits_multi1)
            res_multi2.append(logits_multi2)
            batched_main.append(y)
        logits_binary = self.cls_layer(torch.stack(batched_main))
        multi1_t = torch.stack(res_multi1)
        multi2_t = torch.stack(res_multi2)
        multi1 = self.multi_softmax(multi1_t)
        multi2 = self.multi_softmax(multi2_t)


        return logits_binary, multi1, multi2


## Padding

class EMBA_Padding(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
        sent1_emb = []
        sent2_emb = []
        for i in range (len(seq)):
            lst = seq[i].tolist()
            sep_index = lst.index(102)
            lst_seq1 = lst[0:sep_index+1]
            lst_seq2 = lst[sep_index+1:]
            # first sentence
            if 0 in lst_seq1:
                lst_seq1_ind = lst_seq1.index(0)
            else:
                lst_seq1_ind = sep_index
            # second sentence
            if 0 in lst_seq2:
                lst_seq2_ind = lst_seq2.index(0)
            else:
                lst_seq2_ind = 512
            sent1_emb.append(temp[i][1:lst_seq1_ind][:])
            sent2_emb.append(temp[i][sep_index+1 : sep_index+1+lst_seq2_ind][:])

        sent1_emb_ts = pad_sequence(sent1_emb, batch_first=True)
        sent2_emb_ts = pad_sequence(sent2_emb, batch_first=True)

        interaction_mat1 = torch.matmul(sent1_emb_ts, torch.transpose(sent2_emb_ts, 1, 2)) 
        alpha1 = F.softmax(interaction_mat1, dim=1) 
        beta1 = F.softmax(interaction_mat1, dim=2) 
        beta_avg1 = beta1.mean(dim=1, keepdim=True) 
        gamma1 = torch.matmul(alpha1, beta_avg1.transpose(1, 2)) 
        weighted_sum1 = torch.matmul(torch.transpose(sent1_emb_ts, 1, 2), gamma1).squeeze(-1)
        logits_binary = self.cls_layer(weighted_sum1)
        logits_multi1 = self.multi1_cls_layer(torch.mean(sent1_emb_ts,1))
        logits_multi2 = self.multi2_cls_layer(torch.mean(sent2_emb_ts,1))
        multi1 = self.multi_softmax(logits_multi1)
        multi2 = self.multi_softmax(logits_multi2)

        return logits_binary, multi1, multi2

# ## Original jointbert
class JointBertModelLogit(BaseModel):
    def __init__(self, num_classes_multi, num_classes=1, freeze_bert=False):
        super().__init__()

        self.num_classes_multi = num_classes_multi
        self.bert_layer = BertModel.from_pretrained('bert-base-uncased')

        # Freeze bert layers
        if freeze_bert:
            for p in self.bert_layer.parameters():
                p.requires_grad = False

        # Classification layer
        self.cls_layer = nn.Linear(768, num_classes)
        self.multi1_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi2_cls_layer = nn.Linear(768, num_classes_multi)
        self.multi_softmax = nn.LogSoftmax(1)
        self._init_weights_bert(self.cls_layer)
        self._init_weights_bert(self.multi1_cls_layer)
        self._init_weights_bert(self.multi2_cls_layer)

    @autocast()
    def forward(self, seq, token_ids, attn_masks):
        '''
        Inputs:
            -seq : Tensor of shape [B, T] containing token ids of sequences
            -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
        '''
        # Feeding the input to BERT model to obtain contextualized representations
        _, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)

        # Feeding cls_rep to the classifier layer
        logits_binary = self.cls_layer(pooler_output)
        logits_multi1 = self.multi1_cls_layer(pooler_output)
        logits_multi2 = self.multi2_cls_layer(pooler_output)

        multi1 = self.multi_softmax(logits_multi1)
        multi2 = self.multi_softmax(logits_multi2)

        return logits_binary, multi1, multi2