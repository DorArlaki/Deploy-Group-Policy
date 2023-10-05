### Use this Query, Change hostname for the ones you want to apply the GPO 
```sql
SELECT * FROM Win32_ComputerSystem WHERE Name = 'PC-004' OR Name = 'PC-005'
```


### Use this Query, Change hostname for the ones you do NOT want to apply the GPO
```sql
SELECT * FROM Win32_ComputerSystem WHERE NOT (Name = 'PC-004' OR Name = 'PC-005')
```
