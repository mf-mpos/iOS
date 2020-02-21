# dukptLoadKey

###### 接口功能
> DUKPT密钥下载

###### 函数原型

```objective-c
-(int) dukptLoadKey:(MFEU_DUKPT_ALG)alg
          withIndex:(MFEU_KEY_INDEX)index
            withKey:(NSString *)key
            withKsn:(NSString*)ksn;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| alg| [MFEU_DUKPT_ALG](enum-cn.md#MFEU_DUKPT_ALG) | DUKPT加密算法 |
| keyIndex| [MFEU_KEY_INDEX](enum-cn.md#MFEU_KEY_INDEX) | 密钥索引 |
| key| NSString | 指定密钥值 |
| ksn| NSString | 当前KSN号 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didDukptLoadKeyResp:withKvc

```objective-c
-(void) didDukptLoadKeyResp: (MFEU_MSR_RESP)resp
                    withKvc: (NSString *)kvc;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum-cn.md#MFEU_MSR_RESP) | 终端上的结果返回 |
| kvc| NSString | PEK对应的KVC值 |

