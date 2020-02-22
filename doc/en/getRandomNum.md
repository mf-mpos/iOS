# getRandomNum

### Interface functions
> Get random number 

### Prototype

```objective-c
-(NSInteger) getRandomNum;
```

- #### Parameter
> void

- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |


### Delegate

```objective-c
-(void) didGetRandNumResp:(NSString *)randNum;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| randNum| NSString | Random number |

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md)

