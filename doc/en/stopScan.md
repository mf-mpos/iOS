# stopScan

### Interface functions
> Stop scan bluetooth devices

### Prototype

```objective-c
-(void) stopScan;
```

- #### Parameter
> void

- #### Return
> void

### Delegate

```objective-c
-(void) didStopScanBtDevice;
```

- #### Return parameter
> void

```objective-c
-(void) didStopScanBtDevice: (NSMutableArray *)deviceArray;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| deviceArray| NSMutableArray | List of all Bluetooth devices found (including name + UUID) |

### See also
[Home](../README.md) | [openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [connectBtDevice](connectBtDevice.md) | [disconnectBtDevice](disconnectBtDevice.md)
