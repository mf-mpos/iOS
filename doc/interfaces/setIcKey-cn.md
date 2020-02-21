# setIcKey

###### 接口功能
> 设置终端IC卡公钥参数

###### 函数原型

```objective-c
-(void) setIcKey: (NSArray *)dataArray;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| dataArray| NSArray | 多组IC卡公钥（BCD格式） |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didLoadWorkKeyResp:
回调时机：停止蓝牙设备搜索
```objective-c
-(void) didSetICKeyResp:(NSInteger)index 
			 totalCount:(NSInteger)total;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| index| NSInteger | 当前IC公钥索引 |
| total| NSInteger | 下载IC公钥总数 |

