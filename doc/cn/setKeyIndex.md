# setKeyIndex

### 接口功能

> 设置密钥索引

### 函数原型

```objective-c
-(NSInteger) setKeyIndex: (MFEU_KEY_INDEX)index;
```

- #### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| keyIndex| [MFEU_KEY_INDEX](enum.md#MFEU_KEY_INDEX) | 密钥索引 |

- #### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| -1 | 蓝牙未连接 |
| else | 返回蓝牙发送字节数 |


### 相关回调函数

```objective-c
-(void) didSetKeyIndexResp:(MFEU_MSR_RESP)resp;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| resp| [MFEU_MSR_RESP](enum.md#MFEU_MSR_RESP) | 终端上的结果返回 |

### 参考相关函数
[接口列表](../README.md) | [loadMasterKey](loadMasterKey.md) | [loadWorkKey](loadWorkKey.md) | [setKeyIndex](setKeyIndex.md) | [setIcAid](setIcAid.md) | [setIcKey](setIcKey.md)
