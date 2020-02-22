# setTimeout

### Interface functions
> Set the timeout for receiving Bluetooth communication instructions

### Prototype

```objective-c
-(void) setTimeout: (NSInteger) timeout;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| timeout| NSInteger | 指令接收的超时时间 |

- #### Return
> void

### Delegate
```objective-c
-(void) didTimeout;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [getVersion](getVersion.md) | [readPosInfoEx](readPosInfoEx.md) | [updatePos](updatePos.md)
