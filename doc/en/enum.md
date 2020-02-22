# enum definitions

#### [MFEU_MSR_RESP](#MFEU_MSR_RESP) | Operation result returned
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_RESP_SUCC | 0x00 | SUCCESS |
| MF_RESP_FAIL | 0x01 | FAILURE |

#### [MFEU_MPOS_RESP](MFEU_MPOS_RESP) | MPOS operation result returned
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_MPOS_RESP_CANCEL | 0x00 | User cancel |
| MF_MPOS_RESP_MAGTEK | 0x01 | Use magnetic card |
| MF_MPOS_RESP_ICC | 0x02 | Use IC card |
| MF_MPOS_RESP_RFID | 0x03 | Use RF card |
| MF_MPOS_RESP_FORCE_IC | 0x04 | Force IC card |
| MF_MPOS_RESP_TIMEOVER | 0x05 | Read timeout |
| MF_MPOS_RESP_CARD_FAIL | 0x06 | Read failure |

#### [MFEU_CARD_TYPE](MFEU_CARD_TYPE) | Read card type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_CARD_MAG | 0x01 | 磁条卡 |
| MF_CARD_ICC | 0x02 | IC卡 |
| MF_CARD_RF | 0x03 | 非接卡 |

#### [MFEU_MSR_REAUTH_RESP](MFEU_MSR_REAUTH_RESP) | Second authorization result returned
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_RESP_REAUTH_UNKNOWN | 0x00 | Unknown error |
| MF_RESP_REAUTH_ACCEPT | 0x01 | Transaction accept |
| MF_RESP_REAUTH_GACAAC | 0x02 | Transaction rejection |
| MF_RESP_REAUTH_ONLINE | 0x03 | Online |
| MF_RESP_REAUTH_REJECT | 0x04 | Reauth transaction refused |
| MF_RESP_REAUTH_FAIL | 0xFF | Transaction failure |

#### [MFEU_MSR_DEVSTAT](MFEU_MSR_DEVSTAT) | Inject key status
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_DEVSTAT_DEFAULT | 0xFF | Default status |
| MF_DEVSTAT_WKEYIN | 0x00 | Injected Work Key |
| MF_DEVSTAT_MKEYIN | 0x01 | Injected Master Key |
| MF_DEVSTAT_KEKMOD | 0x02 | Injected KEK Key |

#### [MFEU_MSR_KEYTYPE](MFEU_MSR_KEYTYPE) | Input key press
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_KEYTYPE_OK | 0x00 | Press OK |
| MF_KEYTYPE_TIMEOUT | 0x02 | Press timeout |
| MF_KEYTYPE_CANCEL | 0x06 | Press cancel |

#### [MFEU_MSR_INFO](MFEU_MSR_INFO) | MPOS transaction tips
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_INFO_CUSTOM | 0x00 | Follow custom content tips |
| MF_INFO_WAITCARD | 0x01 | Waiting |
| MF_INFO_READCARD | 0x02 | Reading |
| MF_INFO_WAITPIN | 0x03 | Wait for user to enter password |


#### [MFEU_KEY_LENGTH](MFEU_KEY_LENGTH)  Key length
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_LEN_SINGLE | 0x01 | Single length(8 digits) |
| MF_LEN_DOUBLE | 0x02 | Double length(16 digits) |

#### [MFEU_ENCRYPT_METHOD](MFEU_ENCRYPT_METHOD) Encrypt method
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_ENCRYPT_KEK | 0x00 | Encrypt in KEK |
| MF_ENCRYPT_MAINKEY | 0x01 | Encrypt in old MAK |
| MF_ENCRYPT_PLAINTEXT | 0x02 | Plain text |

#### [MFEU_KEY_INDEX](MFEU_KEY_INDEX) Key index
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_KEY_IND_0 | 0x00 | Key index 0 |
| MF_KEY_IND_1 | 0x01 | Key index 1 |
| MF_KEY_IND_2 | 0x02 | Key index 2 |
| MF_KEY_IND_3 | 0x03 | Key index 3 |
| MF_KEY_IND_4 | 0x04 | Key index 4 |
| MF_KEY_IND_5 | 0x05 | Key index 5 |
| MF_KEY_IND_6 | 0x06 | Key index 6 |
| MF_KEY_IND_7 | 0x07 | Key index 7 |

#### [MFEU_WKEY_TYPE](MFEU_WKEY_TYPE) | Key Type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_WKEY_PIN | 0x01 | PIN Key |
| MF_WKEY_MAC | 0x02 | MAC Key |
| MF_WKEY_TRACK | 0x03 | Track data Key |
} ;

#### [MFEU_MAC_ALG](MFEU_MAC_ALG) | MAC Algorithm
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_MACALG_UBC | 0x00 | UBCAlgorithm |
| MF_MACALG_X99 | 0x01 | X99/X919 |
| MF_MACALG_EBC | 0x02 | EBCAlgorithm |
| MF_MACALG_ENCRYPT_UPAY | 0x0A | UNIONPAY |
| MF_MACALG_ENCRYPT_X99 | 0x0B | UNIONPAY X99 |
| MF_MACALG_ENCRYPT_X919 | 0x0C | UNIONPAY X919 |
| MF_MACALG_ENCRYPT_XOR | 0x0D | XOR |

#### [MFEU_PIN_ENCRYPT](MFEU_PIN_ENCRYPT) | PIN - Algorithm Type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_PIN_ENCRYPT_TEXT | 0x00 | Plain text |
| MF_PIN_ENCRYPT_XOR | 0x01 | Xor |
| MF_PIN_ENCRYPT_SNXOR | 0x02 | Xor by SN |

#### [MFEU_ECASH_TRADE](MFEU_ECASH_TRADE) | Electronic cash transaction indicator
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_ECASH_FORBIT | 0x00 | No |
| MF_ECASH_PERMIT | 0x01 | YES |

#### [MFEU_PBOC_FLOW](MFEU_PBOC_FLOW) | PBOC Process instructions
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_PBOC_FULL | 0x06 | Full process|
| MF_PBOC_PART | 0x01 | First ciphertext generation |

#### [MFEU_IC_ONLINE](MFEU_IC_ONLINE) | IC online flag
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_ONLINE_NO | 0x30 | NO |
| MF_ONLINE_YES | 0x31 | YES |

#### [MFEU_ONLINE_RESULT](MFEU_ONLINE_RESULT) | Online result
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_ONLINE_SUCC | 0x00 | SUCCESS |
| MF_ONLINE_FAIL | 0x01 | FAILURE |

#### [MFEU_PINREQ](MFEU_PINREQ) | PIN Input require
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_PINREQ_NO | 0x00 | No input required |
| MF_PINREQ_YES | 0x01 | Input required |
| MF_PINREQ_AUTO | 0x02 | Automatic password-proof judgment (when less than the amount of password-free, the password is not input or received, and the IC card needs to input password) |

#### [MFEU_FAILBACK](MFEU_FAILBACK) | Failback flag
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_FAILBACK_NO | 0x00 | NO |
| MF_FAILBACK_YES | 0x01 | YES |

#### [MFEU_TRADE_TYPE](MFEU_TRADE_TYPE) | Transaction type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_FUNC_BALANCE | 0x00 | Query |
| MF_FUNC_SALE | 0x01 | Sale |
| MF_FUNC_PREAUTH | 0x02 | Pre-authorization |
| MF_FUNC_AUTHSALE | 0x03 | Pre-authorization completion request |
| MF_FUNC_AUTHSALEOFF | 0x04 | Pre-authorization completion notice |
| MF_FUNC_AUTHSETTLE | 0x05 | Pre-authorized settlement |
| MF_FUNC_ADDTO_PREAUTH | 0x06 | Add Pre-authorization |
| MF_FUNC_REFUND | 0x07 | Refund |
| MF_FUNC_VOID_SALE | 0x08 | Transaction cancel |
| MF_FUNC_VOID_AUTHSALE | 0x09 | pre-authorization completed |
| MF_FUNC_VOID_AUTHSETTLE | 0x0A | Settlement cancel |
| MF_FUNC_VOID_PREAUTH | 0x0B | Revocation of pre-grant authorization |
| MF_FUNC_VOID_REFUND | 0x0C | Cancel returns |
| MF_FUNC_OFFLINE | 0x0D | Offline settlement |
| MF_FUNC_ADJUST | 0x0E | Settlement adjustment |


#### [MFEU_DUKPT_ALG](MFEU_DUKPT_ALG) | DUKPT Key Type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_DUKPT_IPEK | 0x00 | IPEK plaintext |
| MF_DUKPT_BDK | 0x01 | BDK plaintext |
| MF_DUKPT_IPEK_ENC_KEK | 0x02 | IPEK ciphertext in KEK |
| MF_DUKPT_BHK_ENC_KEK | 0x03 | BDK ciphertext in KEK |
| MF_DUKPT_IPEK_ENC_MAK | 0x04 | IPEK ciphertext in MAK |
| MF_DUKPT_BHK_ENC_MAK | 0x05 | BDK ciphertext in MAK |

#### [MFEU_DUKPT_TYPE](MFEU_DUKPT_TYPE) | DUKPT key type
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_DUKPT_DES_KEY_PIN | 0x00 | PIN |
| MF_DUKPT_DES_KEY_MAC1 | 0x01 | MAC1 |
| MF_DUKPT_DES_KEY_MAC2 | 0x02 |  MAC2 |
| MF_DUKPT_DES_KEY_DATA1 | 0x03 | DATA1 |
| MF_DUKPT_DES_KEY_DATA2 | 0x04 | DATA2 |
| MF_DUKPT_DES_KEY_PEK | 0x99 | PEK |

#### [MFEU_DUKPT_OPER](MFEU_DUKPT_OPER)
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_DUKPT_ENCRYPT | 0x00 | Encrypt operate |
| MF_DUKPT_DECRYPT | 0x01 | Decrypt operate |

#### [MFEU_DUKPT_METHOD](MFEU_DUKPT_METHOD) 3DES Algorithm
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_DUKPT_ECB | 0x00 | ECB |
| MF_DUKPT_CBC | 0x01 | CBC |


#### [MFEU_MSR_UPGRADE_STAT](MFEU_MSR_UPGRADE_STAT) | Upgrade response status
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_UPSTAT_BEGIN | 0x00 | Begin |
| MF_UPSTAT_DOING | 0x00 | Upgrading |
| MF_UPSTAT_END | 0x01 | End |
 
#### [MFEU_UPGRADE_REQ](MFEU_UPGRADE_REQ) | Upgrade request status
| Name | Value | Description |
| :-------- | :--------| :------ |
| MF_UPREQ_START | 0x01 | Begin |
| MF_UPREQ_DOING | 0x02 | Upgrading |
| MF_UPREQ_FINISH | 0x03 | End |







