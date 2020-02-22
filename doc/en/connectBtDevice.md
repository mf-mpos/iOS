# connectBtDevice

### Interface functions
> Connect a bluetooth device

### Prototype

```objective-c
-(void) connectBtDevice:(NSString *)btDevice;
```

- #### Parameter
| Name | Type | Description |
| :-------- | :--------| :------ |
| btDevice| NSString | Specifying a Bluetooth device by Bluetooth name or UUID connection |

- #### Return
> void

### Delegate

> ##### Callback when bluetooth device successfully connected
```objective-c
-(void) didConnected:(NSString *)devName;
```

- #### Return parameter
| Name | Value | Description |
| :-------- | :--------| :------ |
| devName| NSString | Bluetooth device name on the connection |


> ##### Callback when bluetooth device connect failure
```objective-c
-(void) didConnectFail;
```

- #### Return parameter
> void

### See also
[Home](../README.md) | [openBtDevice](openBtDevice.md) | [scanBtDevice](scanBtDevice.md) | [stopScan](stopScan.md) | [disconnectBtDevice](disconnectBtDevice.md)
