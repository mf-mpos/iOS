# loadWorkKey

### Interface functions
> Inject work key(PIN / MAC / Track)

### Prototype

```objective-c
-(NSInteger)loadWorkKey: (NSString *)pin
                 macKey: (NSString *)mac
               trackKey: (NSString *)track
               keyIndex: (MFEU_KEY_INDEX)index;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| pin| NSString | PIN Key（40 digits: Key[32 digits] + KVC[8 digits]) |
| mac| NSString | MAC Key（40 digits: Key[32 digits] + KVC[8 digits]) |
| track| NSString | Track Key（40 digits: Key[32 digits] + KVC[8 digits]) |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | Key index |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didLoadWorkKeyResp: (MFEU_MSR_RESP)resp;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | Return result from MPOS |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [setKeyIndex](setKeyIndex.md) | [setIcAid](setIcAid.md) | [setIcKey](setIcKey.md)
