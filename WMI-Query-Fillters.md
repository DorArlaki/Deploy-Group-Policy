# Option 1 - `hostname Fillter`:
### Use this Query, Change hostname for the ones you `Wants` to apply the GPO 
```sql
SELECT * FROM Win32_ComputerSystem WHERE Name = 'PC-004' OR Name = 'PC-005'
```
### Use this Query, Change hostname for the ones you `Do NOT Wants` to apply the GPO
```sql
SELECT * FROM Win32_ComputerSystem WHERE NOT (Name = 'PC-004' OR Name = 'PC-005')
```

# Option 2:
