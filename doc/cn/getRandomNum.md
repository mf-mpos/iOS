# getRandomNum

### 接口功能

> 获取随机数请求

### 函数原型

```objective-c
-(NSInteger) getRandomNum;
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
-(void) didGetRandNumResp:(NSString *)randNum;
```

- #### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| randNum| NSString | 终端返回的随机数 |

### 参考相关函数
[接口列表](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md)

