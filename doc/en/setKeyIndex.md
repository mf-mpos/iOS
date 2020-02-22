# setKeyIndex

### Interface functions
> Set Key index

### Prototype

```objective-c
-(NSInteger) setKeyIndex: (MFEU_KEY_INDEX)index;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didSetKeyIndexResp:(MFEU_MSR_RESP)resp;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | Return result from MPOS |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [setIcAid](setIcAid.md) | [setIcKey](setIcKey.md)
