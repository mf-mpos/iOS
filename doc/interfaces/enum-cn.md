# enum 枚举定义

#### [MFEU_MSR_RESP](#MFEU_MSR_RESP)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_RESP_SUCC | 0x00 | 成功 |
| MF_RESP_FAIL | 0x01 | 失败 |

#### [MFEU_MPOS_RESP](MFEU_MPOS_RESP)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_MPOS_RESP_CANCEL | 0x00 | 用户取消 |
| MF_MPOS_RESP_MAGTEK | 0x01 | 磁条卡交易 |
| MF_MPOS_RESP_ICC | 0x02 | IC卡交易 |
| MF_MPOS_RESP_RFID | 0x03 | 非接交易 |
| MF_MPOS_RESP_FORCE_IC | 0x04 | 强制IC卡 |
| MF_MPOS_RESP_TIMEOVER | 0x05 | 刷卡超时 |
| MF_MPOS_RESP_CARD_FAIL | 0x06 | 读卡失败 |

#### [MFEU_CARD_TYPE](MFEU_CARD_TYPE)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_CARD_MAG | 0x01 | 磁条卡 |
| MF_CARD_ICC | 0x02 | IC卡 |
| MF_CARD_RF | 0x03 | 非接卡 |

#### [MFEU_MSR_REAUTH_RESP](MFEU_MSR_REAUTH_RESP)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_RESP_REAUTH_UNKNOWN | 0x00 | 未知错误 |
| MF_RESP_REAUTH_ACCEPT | 0x01 | 交易授受 |
| MF_RESP_REAUTH_GACAAC | 0x02 | 交易拒绝 |
| MF_RESP_REAUTH_ONLINE | 0x03 | 联机 |
| MF_RESP_REAUTH_REJECT | 0x04 | 二次授权交易拒绝 |
| MF_RESP_REAUTH_FAIL | 0xFF | 交易失败 |

#### [MFEU_MSR_DEVSTAT](MFEU_MSR_DEVSTAT)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_DEVSTAT_DEFAULT | 0xFF | 默认初始状态 |
| MF_DEVSTAT_WKEYIN | 0x00 | 工作密钥已灌装 |
| MF_DEVSTAT_MKEYIN | 0x01 | 主密钥已灌装 |
| MF_DEVSTAT_KEKMOD | 0x02 | KEK已修改 |

#### [MFEU_MSR_UPGRADE_STAT](MFEU_MSR_UPGRADE_STAT)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_UPSTAT_BEGIN | 0x00 | 升级开始 |
| MF_UPSTAT_DOING | 0x00 | 升级中 |
| MF_UPSTAT_END | 0x01 | 升级结束 |

#### [MFEU_MSR_KEYTYPE](MFEU_MSR_KEYTYPE)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_KEYTYPE_OK | 0x00 | 确认键 |
| MF_KEYTYPE_TIMEOUT | 0x02 | 取消键 |
| MF_KEYTYPE_CANCEL | 0x06 | 取消键 |

#### [MFEU_MSR_INFO](MFEU_MSR_INFO)
| 名称 | 值 | 说明 |
| :-------- | :--------| :------ |
| MF_INFO_CUSTOM | 0x00 | 按照自定义内容提示 |
| MF_INFO_WAITCARD | 0x01 | 等待刷卡 |
| MF_INFO_READCARD | 0x02 | 正在读卡 |
| MF_INFO_WAITPIN | 0x03 | 等待用户输入密码 |







