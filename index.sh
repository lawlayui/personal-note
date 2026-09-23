#!/bin/bash 

declare -A user

user["nama"]="Budi"
user["kota"]="Bandung" 

echo ${user["nama"]}
echo ${user["kota"]}
