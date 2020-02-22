# setIcKey

### Interface functions
> Set IC card Keys parameters

### Prototype

```objective-c
-(void) setIcKey: (NSArray *)dataArray;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| dataArray| NSArray | Multiple sets of IC card public keys (BCD format) |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didSetICKeyResp:(NSInteger)index 
			 totalCount:(NSInteger)total;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| index| NSInteger | Current download Index |
| total| NSInteger | Total downlod count |

### See also
[Home](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setIcAid](setIcAid.md) | [setKeyIndex](setKeyIndex.md)