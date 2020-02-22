# readPosInfoEx

### 接口功能

> 获取终端信息

### 函数原型

```objective-c
-(NSInteger)readPosInfoEx;
```

- #### 参数
> 空

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didReadPosInfoResp:(NSString *)sn
                    status:(MFEU_MSR_DEVSTAT)status
                   battery:(MFEU_MSR_BATTERY)battery
                   app_ver:(NSString *)app_ver
                  data_ver:(NSString *)data_ver
               custom_info:(NSString *)custom_info
                 dev_model:(NSString *)model;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| sn | NSString | 终端序列号 |
| status | [MFEU_MSR_DEVSTAT](enum.md#MFEU_MSR_DEVSTAT) | 密钥状态 |
| battery | [MFEU_MSR_BATTERY](enum.md#MFEU_MSR_BATTERY) | 电池电量 |
| app_ver | NSString | 应用版本号 |
| data_ver | NSString | 数据版本号 |
| custom_info | NSString | 自定义信息 |
| dev_model | NSString | 终端类型 |

### 参考相关函数
[接口列表](../README.md) | [setDatetime](setDatetime.md) | [setFactoryCode](setFactoryCode.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)

