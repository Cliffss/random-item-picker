#!/bin/bash

randomize() { grep '[^ \t]' | sort -R; }

echo 'Enter your desired amount of lines generated'
read lines

a=./words/adjectives
n=./words/nouns

while (( lines-- )) && read a && read n <&3
do
    echo "$a $n"
sleep .5
done < <(randomize < $a) 3< <(randomize < $n)
