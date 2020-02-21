# getRandomNum

###### 接口功能
> 获取随机数请求

###### 函数原型

```objective-c
-(NSInteger) getRandomNum;
```

###### 参数
> 空

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didLoadWorkKeyResp:

```objective-c
-(void) didGetRandNumResp:(NSString *)randNum;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| randNum| NSString | 终端返回的随机数 |

