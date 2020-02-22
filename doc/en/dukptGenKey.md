# dukptGenKey

### Interface functions
> Generate DUKPT a new KSN (Incremental operation) 

### Prototype

```objective-c
-(int) dukptGenKey: (MFEU_KEY_INDEX)index;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| index| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didDukptGenKeyResp:(NSString *)ksn;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| ksn| NSString | Current KSN on MPOS |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [dukptLoadKey](dukptLoadKey.md) | [dukptGetKey](dukptGetKey.md) | [dukptDes](dukptDes.md)

