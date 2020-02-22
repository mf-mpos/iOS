# updatePos

### Interface functions
> MPOS firmware upgrade

### Prototype

```objective-c
-(NSInteger) updatePos: (NSString *)upgradeFilename;
```

- #### Paramter
| Name | Type | Type |
| :-------- | :--------| :------ |
| upgradeFilename| NSString | Specify the path accessible by the firmware file |

- #### Return
| Type | Type |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate
```objective-c
-(void) didUpgradeResp:(NSInteger) pos
                  size:(NSInteger) length;
```

- #### Return parameter
| Name | Type | Type |
| :-------- | :--------| :------ |
| pos| NSInteger | Current postion |
| length| NSInteger | File length |

### See also
[Home](../README.md) | [setTimeout](setTimeout.md) | [readPosInfoEx](readPosInfoEx.md) | [getVersion](getVersion.md)

