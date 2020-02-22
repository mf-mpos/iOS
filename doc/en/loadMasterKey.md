# loadMasterKey

### Interface functions
> Inject Master key

### Prototype

```objective-c
-(NSInteger)loadMasterKey: (NSString *)mk
            encryptMethod: (MFEU_ENCRYPT_METHOD)method
                 keyIndex: (MFEU_KEY_INDEX)index;

```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| mk| NSString | Master key（40 digits: Key[32 digits] + KVC[8 digits]) |
| method| [MFEU_ENCRYPT_METHOD](enum.md#MFEU_ENCRYPT_METHOD) | Encrypt method |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didLoadMasterKeyResp: (MFEU_MSR_RESP)resp;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | Return result from MPOS |

### See also
[Home](../README.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [setIcAid](setIcAid.md) | [setIcKey](setIcKey.md)
