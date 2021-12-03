#!/bin/bash

cat << "EOF"
  _____             _   _  _____    ____   __  __     _____  _______  ______  __  __     _____  _____  _____  _  __ ______  _____  
 |  __ \     /\    | \ | ||  __ \  / __ \ |  \/  |   |_   _||__   __||  ____||  \/  |   |  __ \|_   _|/ ____|| |/ /|  ____||  __ \ 
 | |__) |   /  \   |  \| || |  | || |  | || \  / |     | |     | |   | |__   | \  / |   | |__) | | | | |     | ' / | |__   | |__) |
 |  _  /   / /\ \  | . ` || |  | || |  | || |\/| |     | |     | |   |  __|  | |\/| |   |  ___/  | | | |     |  <  |  __|  |  _  / 
 | | \ \  / ____ \ | |\  || |__| || |__| || |  | |    _| |_    | |   | |____ | |  | |   | |     _| |_| |____ | . \ | |____ | | \ \ 
 |_|  \_\/_/    \_\|_| \_||_____/  \____/ |_|  |_|   |_____|   |_|   |______||_|  |_|   |_|    |_____|\_____||_|\_\|______||_|  \_\

EOF
randomize() { grep '[^ \t]' | sort -R; }

echo 'Enter your desired amount of lines generated'
read lines

n=1
log="log$n.txt"
while [ -f $log ]
do
        n=$((n+1))
        log="log$n.txt"
done
touch $log



a=./words/adjectives.txt
n=./words/nouns.txt


echo 'Do you wish to log the results? (y/n) '
read answer
if [ $answer == 'y' ]
then
printf -v _hr "%*s" $(tput cols) && echo ${_hr// /${1--}}
while (( lines-- )) && read a && read n <&3
do
echo "$a $n" >> $log
sleep .3
done < <(randomize < $a) 3< <(randomize < $n)
cat "$(ls -1rt | tail -n1)"
else
printf -v _hr "%*s" $(tput cols) && echo ${_hr// /${1--}}
while (( lines-- )) && read a && read n <&3
do
echo "$a $n"
sleep .5
done < <(randomize < $a) 3< <(randomize < $n)
fi
$SHELL
