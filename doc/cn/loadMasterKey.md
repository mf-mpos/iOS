# loadMasterKey

### 接口功能

> 主密钥下载

### 函数原型

```objective-c
-(NSInteger)loadMasterKey: (NSString *)mainKey
            encryptMethod: (MFEU_ENCRYPT_METHOD)method
                 keyIndex: (MFEU_KEY_INDEX)index;

```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| mainKey| NSString | 主密钥（40位: 32位密钥+8位KVC) |
| method| [MFEU_ENCRYPT_METHOD](enum.md#MFEU_ENCRYPT_METHOD) | 加密方式 |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | 密钥索引 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didLoadMasterKeyResp: (MFEU_MSR_RESP)resp;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | 终端上的结果返回 |

### 参考相关函数
[接口列表](../README.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [setIcAid](setIcAid.md) | [setIcKey](setIcKey.md)
