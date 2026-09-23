
|**Operator**|**Singkatan Dari**|**Arti / Fungsi**|**Contoh [ ... ]**|**Contoh (( ... ))**|
|---|---|---|---|---|
|**`-eq`**|**_E_** _Q_ ual|Sama dengan|`[ $a -eq $b ]`|`(( a == b ))`|
|**`-ne`**|**_N_** ot **_E_** qual|Tidak sama dengan|`[ $a -ne $b ]`|`(( a != b ))`|
|**`-gt`**|**_G_** reater **_T_** han|Lebih besar dari|`[ $a -gt $b ]`|`(( a > b ))`|
|**`-ge`**|**_G_** reater or **_E_** qual|Lebih besar dari atau sama dengan|`[ $a -ge $b ]`|`(( a >= b ))`|
|**`-lt`**|**_L_** ess **_T_** han|Lebih kecil dari|`[ $a -lt $b ]`|`(( a < b ))`|
|**`-le`**|**_L_** ess or **_E_** qual|Lebih kecil dari atau sama dengan|`[ $a -le $b ]`|`(( a <= b ))`|

Contoh: 

```bash 
#!/bin/bash

a=10
b=5

# 1. Menggunakan sintaks kurung siku [ ... ] dengan flag huruf
[ $a -eq $b ]
echo "a sama dengan b? Status exit code: $?" # Output: 1 (False)

[ $a -gt $b ]
echo "a lebih besar dari b? Status exit code: $?" # Output: 0 (True)

# 2. Menggunakan sintaks kurung ganda (( ... )) dengan simbol matematika
(( a >= b ))
echo "a >= b? Status exit code: $?" # Output: 0 (True)

(( a <= b ))
echo "a <= b? Status exit code: $?" # Output: 1 (False)
```

