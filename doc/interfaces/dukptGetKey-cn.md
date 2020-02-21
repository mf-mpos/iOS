# dukptGetKey

###### 接口功能
> 获取当前DUKPT数据

###### 函数原型

```objective-c
-(int) dukptGetKey: (MFEU_KEY_INDEX)index
          withType: (MFEU_DUKPT_TYPE)type;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| keyIndex| [MFEU_KEY_INDEX](enum-cn.md#MFEU_KEY_INDEX) | 密钥索引 |
| type| [MFEU_DUKPT_TYPE](enum-cn.md#MFEU_DUKPT_TYPE) | DUKPT密钥类型 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didDukptGetKeyResp:withKsn

```objective-c
-(void) didDukptGetKeyResp: (NSString *)key
                   withKsn: (NSString *)ksn;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| key| NSString | 指定密钥值 |
| ksn| NSString | 当前KSN号 |

### 参考相关函数
[接口列表](../README-cn.md) | [loadMasterKey](loadMasterKey-cn.md) | [loadWorkKey](loadWorkKey-cn.md) | [setKeyIndex](setKeyIndex-cn.md) | [dukptLoadKey](dukptLoadKey-cn.md) | [dukptGenKey](dukptGenKey-cn.md) | [dukptDes](dukptDes-cn.md)

