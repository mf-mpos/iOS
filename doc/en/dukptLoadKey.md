# dukptLoadKey

### Interface functions
> Inject DUKPT key

### Prototype

```objective-c
-(int) dukptLoadKey:(MFEU_DUKPT_ALG)alg
          withIndex:(MFEU_KEY_INDEX)index
            withKey:(NSString *)key
            withKsn:(NSString*)ksn;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| alg| [MFEU_DUKPT_ALG](enum.md#MFEU_DUKPT_ALG) | DUKPT Algorithm |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |
| key| NSString | Source key |
| ksn| NSString | Current KSN on MPOS |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didDukptLoadKeyResp: (MFEU_MSR_RESP)resp
                    withKvc: (NSString *)kvc;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | Return result from MPOS |
| kvc| NSString | The KVC of PEK |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [dukptGetKey](dukptGetKey.md) | [dukptGenKey](dukptGenKey.md) | [dukptDes](dukptDes.md)

