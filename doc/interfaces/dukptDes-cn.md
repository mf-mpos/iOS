# dukptDes

###### 接口功能
> 使用DUKPT指定密钥进行DES运算

###### 函数原型

```objective-c
-(int) dukptDes: (MFEU_DUKPT_TYPE)type
       withOper: (MFEU_DUKPT_OPER)oper
     withMethod: (MFEU_DUKPT_METHOD)method
       withData: (NSString*)data;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| type | [MFEU_DUKPT_TYPE](enum-cn.md#MFEU_DUKPT_TYPE) | 使用的密钥类型 |
| oper | [MFEU_DUKPT_OPER](enum-cn.md#MFEU_DUKPT_OPER) | 加密 或 解密 |
| method | [MFEU_DUKPT_METHOD](enum-cn.md#MFEU_DUKPT_METHOD) | 3DES加密算法 |
| data | NSString | 运算数据 |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didDukptDesResp:

```objective-c
-(void) didDukptDesResp:(NSString *)result;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| result| NSString | 运算后的结果 |

