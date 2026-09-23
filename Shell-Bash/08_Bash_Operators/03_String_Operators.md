
|**Operator**|**Fungsi / Kondisi Bernilai TRUE Jika...**|**Contoh Sintaks [ ... ]**|**Contoh Sintaks [[ ... ]]**|
|---|---|---|---|
|**`=`** / **`==`**|String **sama persis** (identik)|`[ "$a" = "$b" ]`|`[[ "$a" == "$b" ]]`|
|**`!=`**|String **tidak sama**|`[ "$a" != "$b" ]`|`[[ "$a" != "$b" ]]`|
|**`-z`**|String **kosong** _(zero length / panjang 0)_|`[ -z "$a" ]`|`[[ -z "$a" ]]`|
|**`-n`**|String **ada isinya** _(non-zero length)_|`[ -n "$a" ]`|`[[ -n "$a" ]]`|
|**`<`**|String A di depan String B _(urutan alfabet/ASCII)_|`[ "$a" \< "$b" ]`|`[[ "$a" < "$b" ]]`|
|**`>`**|String A di belakang String B _(urutan alfabet/ASCII)_|`[ "$a" \> "$b" ]`|`[[ "$a" > "$b" ]]`|

Contoh: 

```bash 
#!/bin/bash

str1="Budi"
str2="Andi"
str3=""

# 1. Memeriksa Kesamaan & Ketidaksamaan
[ "$str1" == "Budi" ]
echo "str1 adalah Budi? Exit status: $?" # Output: 0 (True)

[ "$str1" != "$str2" ]
echo "str1 beda dengan str2? Exit status: $?" # Output: 0 (True)

# 2. Memeriksa String Kosong (-z) dan Ada Isi (-n)
[ -z "$str3" ]
echo "str3 kosong? Exit status: $?" # Output: 0 (True)

[ -n "$str1" ]
echo "str1 ada isinya? Exit status: $?" # Output: 0 (True)

# 3. Perbandingan Urutan Alfabet (Gunakan [[ ]] agar lebih aman tanpa escape)
[[ "$str2" < "$str1" ]]
echo "Andi (str2) lebih dulu dari Budi (str1)? Exit status: $?" # Output: 0 (True)
```

