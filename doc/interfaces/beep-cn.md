# beep

#### 接口功能
> 操作终端蜂鸣器

#### 函数原型

```objective-c
-(NSInteger) beep: (NSInteger)times
             freq: (NSInteger)freq
         duration: (NSInteger)duration
             step: (NSInteger) step;
```

#### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| times| NSInteger | 响鸣次数 |
| freq| NSInteger | 蜂鸣频率(单位:hz) |
| duration| NSInteger | 每次蜂鸣时间(单位:ms) |
| step| NSInteger | 两次蜂鸣时间间隔(单位:ms) |


#### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |

### 相关回调函数
- ###### didBeepResp

```objective-c
-(void) didBeepResp;
```

#### 返回参数
> 空