# setIcAid

### Interface functions
> Set IC card AID parameters

### Prototype

```objective-c
-(void) setIcAid: (NSArray *)dataArray;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| dataArray| NSArray | Multiple sets of IC card AID (BCD format) |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didSetAidResp:(NSInteger)index 
		   totalCount:(NSInteger)total;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| index| NSInteger | Current download Index |
| total| NSInteger | Total downlod count |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setIcKey](setIcKey.md) | [setKeyIndex](setKeyIndex.md)