# setIcAid

###### 接口功能
> 设置终端IC卡AID参数

###### 函数原型

```objective-c
-(void) setIcAid: (NSArray *)dataArray;
```

###### 参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| dataArray| NSArray | 多组AID参数（BCD格式） |

###### 返回值
| 参数类型 | 参数说明 |
| :--------| :------ |
| NSInteger | 正常返回蓝牙发送字节数，-1 表示：蓝牙未准备好 |


### 相关回调函数
- ###### didSetAidResp:totalCount
回调时机：停止蓝牙设备搜索
```objective-c
-(void) didSetAidResp:(NSInteger)index 
		   totalCount:(NSInteger)total;
```

#### 返回参数
| 参数 | 参数类型 | 参数说明 |
| :-------- | :--------| :------ |
| index| NSInteger | 当前AID索引 |
| total| NSInteger | 下载AID总数 |

### 参考相关函数
[接口列表](../README-cn.md) | [loadMasterKey](loadMasterKey-cn.md) | [loadWorkKey](loadWorkKey-cn.md) | [setIcKey](setIcKey-cn.md) | [setKeyIndex](setKeyIndex-cn.md)