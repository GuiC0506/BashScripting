#!/sbin/env bash

# variables
ami=$(whoami)
echo $ami
echo "Variables"
name="Churros"
echo "Hello $name"
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




