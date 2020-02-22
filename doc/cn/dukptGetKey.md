# dukptGetKey

### 接口功能

> 获取当前DUKPT数据

### 函数原型

```objective-c
-(int) dukptGetKey: (MFEU_KEY_INDEX)index
          withType: (MFEU_DUKPT_TYPE)type;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | 密钥索引 |
| type| [MFEU_DUKPT_TYPE](enum.md#MFEU_DUKPT_TYPE) | DUKPT密钥类型 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数
```objective-c
-(void) didDukptGetKeyResp: (NSString *)key
                   withKsn: (NSString *)ksn;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| key| NSString | 指定密钥值 |
| ksn| NSString | 当前KSN号 |

### 参考相关函数
[接口列表](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [dukptLoadKey](dukptLoadKey.md) | [dukptGenKey](dukptGenKey.md) | [dukptDes](dukptDes.md)

