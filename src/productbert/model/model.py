import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F
from base import BaseModel
from transformers import BertModel, BertConfig, DistilBertModel, RobertaModel
from transformers.modeling_bert import BertOnlyMLMHead
from torch.cuda.amp import autocast

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
    # def forward(self, seq, token_ids, attn_masks):
    #     '''
    #     Inputs:
    #         -seq : Tensor of shape [B, T] containing token ids of sequences
    #         -attn_masks : Tensor of shape [B, T] containing attention masks to be used to avoid contibution of PAD tokens
    #     '''
    #     # Feeding the input to BERT model to obtain contextualized representations
    #     temp, pooler_output = self.bert_layer(seq, attention_mask=attn_masks, token_type_ids=token_ids)
    #     sent1_emb = []
    #     sent2_emb = []
    #     for i in range (len(seq)):
    #         lst = seq[i].tolist()
    #         sep_index = lst.index(102)
    #         lst_seq1 = lst[0:sep_index+1]
    #         lst_seq2 = lst[sep_index+1:]
    #         # first sentence
    #         if 0 in lst_seq1:
    #             lst_seq1_ind = lst_seq1.index(0)
    #         else:
    #             lst_seq1_ind = sep_index
    #         # second sentence
    #         if 0 in lst_seq2:
    #             lst_seq2_ind = lst_seq2.index(0)
    #         else:
    #             lst_seq2_ind = 512
    #         sent1_emb.append(temp[i][1:lst_seq1_ind][:])
    #         sent2_emb.append(temp[i][sep_index+1 : lst_seq2_ind][:])
    #     emb_st1 = torch.stack(sent1_emb)
    #     emb_st2 = torch.stack(sent2_emb)
    #     interaction_mat = torch.matmul(emb_st1, torch.transpose(emb_st2, 1, 2)) 
    #     alpha = F.softmax(interaction_mat, dim=1) 
    #     beta = F.softmax(interaction_mat, dim=2) 
    #     beta_avg = beta.mean(dim=1, keepdim=True) 
    #     gamma = torch.matmul(alpha, beta_avg.transpose(1, 2))
    #     weighted_sum = torch.matmul(torch.transpose(emb_st1, 1, 2), gamma).squeeze(-1) 
    #     weighted_sum += emb_st1
    #     logits_binary = self.cls_layer(weighted_sum)
        

        # # Feeding cls_rep to the classifier layer
        # # logits_binary = self.cls_layer(pooler_output)
        # logits_multi1 = self.multi1_cls_layer(emb_st1)
        # logits_multi2 = self.multi2_cls_layer(emb_st2)

        # multi1 = self.multi_softmax(logits_multi1)
        # multi2 = self.multi_softmax(logits_multi2)

        # return logits_binary, multi1, multi2
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

class AOAJointBertModelLogit(BaseModel):
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
        # logits_binary = self.cls_layer(pooler_output)
        # AOA
        interaction_mat1 = torch.matmul(pooler_output, torch.transpose(sep_output, 1, 2)) 
        alpha1 = F.softmax(interaction_mat1, dim=1) 
        beta1 = F.softmax(interaction_mat1, dim=2) 
        beta_avg1 = beta1.mean(dim=1, keepdim=True) 
        gamma1 = torch.matmul(alpha1, beta_avg1.transpose(1, 2))
        weighted_sum = torch.matmul(torch.transpose(pooler_output, 1, 2), gamma1).squeeze(-1) 
        weighted_sum += pooler_output
        logits_binary = self.cls_layer(weighted_sum)

        logits_multi1 = self.multi1_cls_layer(pooler_output)
        logits_multi2 = self.multi2_cls_layer(sep_output)

        multi1 = self.multi_softmax(logits_multi1)
        multi2 = self.multi_softmax(logits_multi2)

        return logits_binary, multi1, multi2