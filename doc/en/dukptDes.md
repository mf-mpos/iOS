# dukptDes

### Interface functions
> DES operation using DUKPT specified key

### Prototype

```objective-c
-(int) dukptDes: (MFEU_DUKPT_TYPE)type
       withOper: (MFEU_DUKPT_OPER)oper
     withMethod: (MFEU_DUKPT_METHOD)method
       withData: (NSString*)data;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| type | [MFEU_DUKPT_TYPE](enum.md#MFEU_DUKPT_TYPE) | Key type |
| oper | [MFEU_DUKPT_OPER](enum.md#MFEU_DUKPT_OPER) | Encrypt or Decrypt |
| method | [MFEU_DUKPT_METHOD](enum.md#MFEU_DUKPT_METHOD) | 3DES Algorithm |
| data | NSString | Source data |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didDukptDesResp:(NSString *)result;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| result| NSString | Calculation results |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [dukptLoadKey](dukptLoadKey.md) | [dukptGetKey](dukptGetKey.md) | [dukptGenKey](dukptGenKey.md)

