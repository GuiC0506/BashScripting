#!/sbin/env bash

set -e # to exit on failures
set -u # to exit on undefined variables

# variables
ami=$(whoami)
echo $ami
echo "Variables"
name="Churros"
echo "$name"
echo "Hello ${name}"
echo "Hello ${#name}" # length of name
echo "Hello ${dog:-"Shoyou"}" # default value if dog does not exist
echo "Hello ${person:="Guilherme"}" # prints as default, and sets the value
echo $person
echo 'Hello $name'

echo "----------------"
#subshell - used for command substitution

echo "Subshells"
onePathBehind=$(cd ..; pwd)
echo "one path behind: " + $onePathBehind
echo "content going to file" >> textfile && echo "The file was created" && bat textfile && rm textfile  && echo "The file was removed"

touch youcantseethecontent
echo "A lucid content" >> youcantseethecontent
shred youcantseethecontent

echo $(whatis whoami)
echo "Node location: $(which node)"
echo "All Node locations: $(whereis node)"

echo $(cmp newfile2 newfile2)

echo "----------------"
cat newfile1 | sort
echo "----------------"
find ~/dev/QuestifyHub -name server.js



cat newfile2 | grep pret
uname -a


echo $(history)

echo $((3 + 3 / 3 * 3 + 10))

# command line args
filename=$1
echo ${#filename}

# conditions
if [[ ${#filename} > 5 ]]; then
    cat $filename
else
    echo "Something broke"
    # exit 1 - exit code
fi

echo "hello"

# string comparison
var="a"
if [[ $var == "a" ]]; then
    echo "It is equal to a"
else
    echo "It is not equal to a"
fi

# numerical comparison
number=3
if [[ $number -eq 1 ]] || [[ $number -lt 4 ]]; then
    echo "The condition is true"
else
    echo "The condition is not true"
fi

random="churros"
#check if it is not null
if [[ -z $random ]]; then
    echo "The value is null"
else
    echo "The value is not null"
fi

file="./newfile1"
if [[ -f $file ]]; then # -d for directories, -e for both
    echo "The file exists"
else
    echo "The file doest not exist"
fi

if [[ -f $file ]] && [[ -r $file ]]; then
    echo "The file exist and i have the permission to read it"
else
    echo "The file does not exist or you don't have the permission to read it"  
fi

echo "Sleeping for 1 seconds"
sleep 1

echo "Type your name" && read -r name
echo $name


read -p "Do you want to continue (Y/N) " resp
if [[ resp != "Y" ]]; then
    echo "Continuing"
else
    exit 1
fi

echo "If this message was shown successfully..." && echo "then, this is going to be shown"
# if the first succeeds, perform the next

echo "----------------"

echo "if the first message was not shown successfully" || echo "then, this second one must be shown regardless"
# if the first fails, than execute the second

false | echo "fails, but execute" # the pipe is executed, even if the first condition is false and "set -e" is setted

#set -euo pipefail
false | echo "fails, but dont execute"


# set -euo pipefail # to not ignore failures, undefined variables and pipes


# arrays
arr=(1 2 3 4 5)
echo ${arr[0]}
echo ${arr[@]}
echo ${#arr[@]} # length of array

# loops

echo "----------------"
for number in ${arr[@]}; do
    echo $number
done

echo "----------------"
for ((i=0; i < ${#arr[@]}; ++i)); do
    echo ${arr[i]}
done

echo "----------------"
length=${#arr[@]}

for i in {1..2}; do
    echo ${arr[i]}
done


for file in $(ls); do
    echo $file
done
