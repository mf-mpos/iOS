# scanBtDevice

### Interface functions
> Scan for nearby Bluetooth devices

### Prototype

```objective-c
-(void) scanBtDevice:(NSInteger)timeout;
```

- #### Paramter
> void

- #### Return
> void

### Delegate- ###### didFoundBtDevice:
> Callback when a Bluetooth device is found

```objective-c
-(void) didFoundBtDevice:(NSString *)btDevice;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| btDevice| NSString | Currently searching for a Bluetooth device name |

### See also
[Home](../README.md) | [openBtDevice](openBtDevice.md) | [stopScan](stopScan.md) | [connectBtDevice](connectBtDevice.md) | [disconnectBtDevice](disconnectBtDevice.md)
