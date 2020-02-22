# setFactoryCode

### Interface functions
> Set MPOS factory code requests

### Prototype

```objective-c
-(NSInteger) setFactoryCode:(NSInteger)factoryid;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| factoryid| NSInteger | Vendor ID. The default value is 0 when the device is turned on. |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

###### Note
The current time will be automatically set on the terminal

### Delegate

```objective-c
-(void) didSetDatetimeResp;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)
