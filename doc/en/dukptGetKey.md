# dukptGetKey

### Interface functions
> Get current KSN on MPOS

### Prototype

```objective-c
-(int) dukptGetKey: (MFEU_KEY_INDEX)index
          withType: (MFEU_DUKPT_TYPE)type;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |
| type| [MFEU_DUKPT_TYPE](enum.md#MFEU_DUKPT_TYPE) | DUKPT Key type |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate
```objective-c
-(void) didDukptGetKeyResp: (NSString *)key
                   withKsn: (NSString *)ksn;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| key| NSString | Key result |
| ksn| NSString | Current KSN on MPOS |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [dukptLoadKey](dukptLoadKey.md) | [dukptGenKey](dukptGenKey.md) | [dukptDes](dukptDes.md)

