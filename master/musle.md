# 11/17 (master to unslave)
1. install node.js https://nodejs.org/en/download/
2. install newman https://github.com/postmanlabs/newman
    npm install newman --g (重要)
        newman run examples/sample-collection.json;
        newman run https://www.getpostman.com/collections/631643-f695cab7-6878-eb55-7943-ad88e1ccfd65-JsLv;
    newman run cl3.json --delay-request 5000
3. 動態資料(本機9002) https://jsfiddle.net/musle/gzm8Ladc/2/
##  於公司瘋狂用tcp 正常 (any to unslave info or trace 都很順暢)  
[0 1- 0 0- 0 6- 88- 3- 1 0- 0 6]快速解析為8段

11/16 撈的資料分析
Modbus格式發：(5F 00) (00 00) (06)    (58)    (03)      (00 FF)       (00 08) CRC
              TID      PID   長度   SlaveID  func   Start address      長度
               [3       3   101        0       0        4               91   39]iii
               [3       3   102        0       0        4               91   99]iii

               05      00     06      88       3        1 2            0 5  (poll st 258 長度5)
               06      00     06      88       3        1 3            0 6  (poll st 259 長度6)
              [13      00     0      124      68       43 13         248 0]
               [3       3     3        0       0        1            133 172]


# 於公司Master.exe U-DC1500 ,TCP .5 -> .10 TCP 測試
## 1. Master 發送DC1500 (id=88) 長度4word測試
Max Loop: 1
Loop sleep: 1000
Devi Sleep: 500
SpreadSheet:

088, U-DC1500, 03, 00256, 00259, [00 6f 00 03 01 4c 00 0c]

Func, Addr, Data, Value
03, 256, [00 6f], 111
03, 257, [00 03], 3
03, 258, [01 4c], 332
03, 259, [00 0c], 12

Start:  1510874299014273800 ns
Ended:  1510874299026274200 ns
Diff:   12000400 (0.012000)
Times:  1
Error:  0

Loop: 1

Mission complete.
## 2. 正常收到長度4 unslave的內容顯示
### 正常測試 (tcp收發回應時間8ms,unslave的config.json frameDelay 調到2ms 則duration=2ms) 
### 同上 ID=0 則DURATION=250ms
### 同上改用PULL TOOLS ID=0 Duration = 1ms
*** 注意我們的會自動disconnect(tcp port),poll 則不會需手動
2017/11/17 07:18:18.474 - INFO: Modbus frame received: [0 1 0 0 0 6 88 3 1 0 0 4]
2017/11/17 07:18:18.479 - INFO: Reading value: 88HR256 =
111
2017/11/17 07:18:18.479 - INFO: Reading value: 88HR257 =
3
2017/11/17 07:18:18.479 - INFO: Reading value: 88HR258 =
332
2017/11/17 07:18:18.479 - INFO: Reading value: 88HR259 =
12
2017/11/17 07:18:18.482 - INFO: Modbus frame sent: [0 1 0 0 0 11 88 3 8 0 111 0 3 1 76 0 12]



2017/11/17 08:50:18.829 - INFO: Modbus frame received: [0 1 0 0 0 6 0 3 1 0 0 4]
2017/11/17 08:54:56.265 - INFO: Modbus frame received: [0 1 0 0 0 6 88 3 1 0 0 4]
2017/11/17 08:54:56.265 - INFO: Reading value: 88HR256 =
111
2017/11/17 08:54:56.265 - INFO: Reading value: 88HR257 =
3
2017/11/17 08:54:56.265 - INFO: Reading value: 88HR258 =
332
2017/11/17 08:54:56.265 - INFO: Reading value: 88HR259 =
12
2017/11/17 08:54:56.265 - INFO: Modbus frame sent: [0 1 0 0 0 11 88 3 8 0 111 0 3 1 76 0 12]

2017/11/17 08:56:42.115 - INFO: Modbus frame received: [0 1 0 0 0 6 0 3 1 0 0 4]
2017/11/17 08:58:52.016 - INFO: Modbus frame received: [0 1 0 0 0 6 88 3 1 0 0 4]
2017/11/17 08:58:52.016 - INFO: Reading value: 88HR256 =
111
2017/11/17 08:58:52.017 - INFO: Reading value: 88HR257 =
3
2017/11/17 08:58:52.017 - INFO: Reading value: 88HR258 =
332
2017/11/17 08:58:52.017 - INFO: Reading value: 88HR259 =
12
2017/11/17 08:58:52.017 - INFO: Modbus frame sent: [0 1 0 0 0 11 88 3 8 0 111 0 3 1 76 0 12]