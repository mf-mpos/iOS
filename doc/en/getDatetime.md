# getDatetime

### Interface functions
> Get current datetime on MPOS

### Prototype

```objective-c
-(NSInteger) getDatetime;
```

- #### Parameter
> void

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didGetDatetimeResp:(NSString *)datetime;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| datetime| NSString | Current datetime(Format: YYYYMMDDhhmmss) |

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [setFactoryCode](setFactoryCode.md) | [getDeviceState](getDeviceState.md)
