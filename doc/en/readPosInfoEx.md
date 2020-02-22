# readPosInfoEx

### Interface functions
> Get MPOS infomation requests

### Prototype

```objective-c
-(NSInteger)readPosInfoEx;
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
-(void) didReadPosInfoResp:(NSString *)sn
                    status:(MFEU_MSR_DEVSTAT)status
                   battery:(MFEU_MSR_BATTERY)battery
                   app_ver:(NSString *)app_ver
                  data_ver:(NSString *)data_ver
               custom_info:(NSString *)custom_info
                 dev_model:(NSString *)model;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| sn | NSString | MPOS serail number |
| status | [MFEU_MSR_DEVSTAT](enum.md#MFEU_MSR_DEVSTAT) | Key status |
| battery | [MFEU_MSR_BATTERY](enum.md#MFEU_MSR_BATTERY) | Battery level |
| app_ver | NSString | App version |
| data_ver | NSString | Data version |
| custom_info | NSString | Custom infomation |
| dev_model | NSString | Terminal model |

### See also
[Home](../README.md) | [setDatetime](setDatetime.md) | [setFactoryCode](setFactoryCode.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)

