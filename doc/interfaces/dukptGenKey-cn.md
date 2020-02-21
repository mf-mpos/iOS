# dukptGenKey

###### 接口功能
> DUKPT KSN 递增操作

###### 函数原型

```objective-c
-(int) dukptGenKey: (MFEU_KEY_INDEX)index;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| index| [MFEU_KEY_INDEX](enum-cn.md#MFEU_KEY_INDEX) | 密钥索引 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didDukptGenKeyResp:

```objective-c
-(void) didDukptGenKeyResp:(NSString *)ksn;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| ksn| NSString | 当前KSN号 |

