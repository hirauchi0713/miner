#!/bin/bash

if [[ $MINERGATE_USER == "" ]] ; then
  echo 'usage: MINERGATE_USER=<youraccount@mail.jp> ./start.sh'
  exit 1
fi

# nice指定で慎ましく起動 (コア数-1を使用)
docker run -d --name miner --cap-add=SYS_NICE minecoins/minergate-cli -user $MINERGATE_USER -xmr $(lscpu | grep  '^CPU(s):' | awk '{ print $2-1; }')

