#!/sbin/env bash

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
    echo "Not a valid condition"
fi
