#!/usr/bin/env bash


mkdir -p st_bot && cd "$_" || exit

wget -qO requirements.txt 	'https://raw.githubusercontent.com/yupirex/GG/main/requirements.txt'
wget -qO main.enc 		'https://github.com/yupirex/GG/releases/latest/download/main.exe'
wget -qO vars.enc 		'https://github.com/yupirex/GG/releases/latest/download/vars.dll'

if command -v python3 &>/dev/null ; then echo apt install python3 -y; fi
if command -v openssl &>/dev/null ; then echo apt install openssl-tool -y; fi
pip3 install -r requirements.txt --no-cache-dir --no-warn-script-location --disable-pip-version-check --upgrade

IFS= read -rp "unpack password :" password

if [[ -r main.enc ]]; then :
  openssl enc -aes-256-cbc -d -iter 1 -pass pass:"${password}" -in main.enc -out main.py
fi

if [[ -r vars.enc ]]; then : 
  openssl enc -aes-256-cbc -d -iter 1 -pass pass:"${password}" -in vars.enc -out nvars.py
fi

rm {vars,main}.enc 

# update vars

: ' 
in:  vars : a=1 b=2 c=3 | nvars : a=2 b=
out: vars : a=2 c=3
'
declare -A vars

read_vars(){ :
  while IFS='=' read -r key value; do
    if [[ -n $value ]]; then
      vars[$key]="$value"
    else
      unset "vars[$key]"
    fi
  done < "$1"
}


if [[ -r nvars.py ]]; then 
  if [[ -r vars.py ]]; then 
    read_vars "vars.py"
    read_vars "nvars.py"
    : > vars.py
    rm nvars.py
  else 
    mv nvars.py vars.py
    IFS= read -rp "input api_id (123456789) :" vars[api_id]
    IFS= read -rp "input api_hash ('a1b2c3d4e5f6') :" vars[api_hash]
  fi

  for el in "${!vars[@]}"; do
    echo "${el}=${vars[$el]}" >> vars.py
  done
fi


