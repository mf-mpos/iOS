# loadMasterKey

###### 接口功能
> 主密钥下载

###### 函数原型

```objective-c
-(NSInteger)loadMasterKey: (NSString *)mainKey
            encryptMethod: (MFEU_ENCRYPT_METHOD)method
                 keyIndex: (MFEU_KEY_INDEX)index;

```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| mainKey| NSString | 主密钥（40位: 32位密钥+8位KVC) |
| method| [MFEU_ENCRYPT_METHOD](enum-cn.md#MFEU_ENCRYPT_METHOD) | 加密方式 |
| keyIndex| [MFEU_KEY_INDEX](enum-cn.md#MFEU_KEY_INDEX) | 密钥索引 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didLoadMasterKeyResp:
回调时机：停止蓝牙设备搜索
```objective-c
-(void) didLoadMasterKeyResp: (MFEU_MSR_RESP)resp;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum-cn.md#MFEU_MSR_RESP) | 终端上的结果返回 |

