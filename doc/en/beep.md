# beep

### Interface functions
> Trigger the MPOS buzzer

### Prototype

```objective-c
-(NSInteger) beep: (NSInteger)times
             freq: (NSInteger)freq
         duration: (NSInteger)duration
             step: (NSInteger) step;
```

- #### Paramter
| Name | Type | Description |
| :-------- | :--------| :------ |
| times| NSInteger | Beep times |
| freq| NSInteger | Beep frequency(Unit:hz) |
| duration| NSInteger | Beep duration time(Unit:ms) |
| step| NSInteger | Beep interval(Unit:ms) |


- #### Return
| Value | Description |
| :--------| :------ |
| -1 | Bluetooth not connected |
| else | send data length via BT |

### Delegate

```objective-c
-(void) didBeepResp;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [readPosInfoEx](readPosInfoEx.md) | [setDatetime](setDatetime.md) | [getDatetime](getDatetime.md) | [getDeviceState](getDeviceState.md)
