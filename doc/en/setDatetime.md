# setDatetime

### Interface functions
> Set MPOS datetime requests

### Prototype

```objective-c
-(NSInteger) setDatetime:(NSString *)datetime
               factoryId:(NSInteger)factoryid;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| datetime| NSString | Datetime，Format: YYYYMMDDHHMMSS |
| factoryid| NSInteger | Vendor ID. The default value is 0 when the device is turned on. |

- #### Return| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didSetDatetimeResp;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setFactoryCode](setFactoryCode.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)
