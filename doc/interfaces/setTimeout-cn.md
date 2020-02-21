# setTimeout

###### 接口功能
> 设置蓝牙通讯指令接收的超时时间

###### 函数原型

```objective-c
-(void) setTimeout: (NSInteger) timeout;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| timeout| NSInteger | 指令接收的超时时间 |

###### 返回值
> 空

### 相关回调函数
- ###### didTimeout
回调时机：指令接收超时
```objective-c
-(void) didTimeout;
```

#### 返回参数
> 空

### 参考相关函数
[接口列表](../README-cn.md) | [getVersion](getVersion-cn.md) | [readPosInfoEx](readPosInfoEx-cn.md) | [updatePos](updatePos-cn.md)
