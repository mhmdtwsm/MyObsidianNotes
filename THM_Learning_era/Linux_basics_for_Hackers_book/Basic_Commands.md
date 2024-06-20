---
tags:
  - grep
  - cd
  - pwd
  - ls
  - find
  - whereis
  - which
  - locate
  - cat
  - rm
  - cp
  - mv
---

`pwd` -or print working directory- to find where you are
```bash
  #  -L	print the value of $PWD if it names the current working directory
  #  -P	print the physical directory, without any symbolic links   
  #  By default, `pwd' behaves as if `-L' were specified.

  pwd
```
---

`whoami` to show you the user name you logged into-there is another command that does some things beyond only printing the the user name and that command called `id`-
```bash
  #  whoami = id -un
  
  whoami
```
---

THE HOLY ******CD****** , `cd` is your atomic rocket to move in the system directories, it is a short for *change directory* or *current directory*
```bash
  # cd {the desired directory}
  # it is good to know that entering only cd without a destination will direct       you to your home
  # the ~ is a shortcut for the /home/usr/ directory
  # the / will get you to the root
  
  cd /home/Desktop/
  cd .. #to get to the parent directory
  cd ../.. #to step back 2 levels
  cd . #to go to the current directory
```
---

`ls` to see the content of a directory, it is a short for list
```bash
  ls
  # the -l is called a flag, and the l flag is a short for long so it returns
  # a long list
  ls -l
  # the -a is a flag to return all files including the hidden ones
  ls -a
  #the -la is a combination of 2 flags so it returns a long list of all the files
  ls -la
  # there is a lot of other usful flags you can know by typing the --help flag
  ls --help
```

---

* ### Finding files commands
`locate` will go through the entire system and search for the word you gave, it is not efficient but sometimes there is no harm of taking a lot of data.
```bash
locate nmap
```
---

`whereis` is a command to find not a file with a name but the binaries of a program, it is more efficient and gives less data but hit the point well.
```bash
whereis nmap
```
---

`which` returns the path of the binaries from the `PATH` variable (the `PATH` is a variable that holds the crucial paths of the binaries that you need)
```bash
which nmap
```
---

`find` is the most powerful and flexible of the searching utilities.
```bash
  # the syntax 
  # find [directory path] -type f -user [username] -group [group name] -size         [size] -newermt '[date and time]  -name [filename]
  # how to use the size: find /home/Andy -type f -size 10c (c for bytes, k for       kilobytes M megabytes, G for gigabytes)
  # use grep : grep -iRl [directory path/keyword]
  
  # to use find basicly first put the directory you want to search in
  # 2nd put the type of your file with -type
  # 3rd enter the name of the files you want to do the search on with -name
  # the syntax : find [directory path] -type f -size [size] -name [filename]
  find /home/p/ -type f -name init.lua
  # there is an option -name init.\*  ===> \* <=== 
  # it is made to search for a part of the name and complete the rest
  find /home/p/ -type f -name init.\*
  # so here it will search for every file starts with init.
  # there is also an option to use [] to specify the charcters you want to           search on the name, like a range of chars [a-e] and so on
  find /home/p -type f -name "*ca[t-z]"
```
---

`grep` it is a powerful tool made to search in the content of the file on a keyword, there is some tools like this tool like `ripgrep` that used to power up plugins in `nvim` for live searching for a key word in multiple files 
```bash
# grep {the word} {the file}
grep fofo file.txt
```

there is also a thing called piping that is a way to take the output of a command and give it to a another command 

```bash
	#this command take the output of the ls command which is a text of the list       of the files and give it to the grep and the grep searches it this word          'file.txt' appeared in the output of the the previous command
	
	ls -la | grep file.txt
```
---
### Directories and files manipulating commands

 1. `mkdir` to make a directory (a folder)
```bash
mkdir newfolder
```
2.  `cat` can let you make a file and write in it !!
```bash
# just type --> cat > {newfilename}
# and then after finshing typing in the file just press CTRL + d
# and to print it --> cat {newfilename}
cat > flie
cat file
# if you want to append in the next line
cat >> file
# if you want to overwrite you can use > again
cat > file
```
3. `touch` could simply touch a file to change some of its details, such as the date it was created or modified. However, if the file doesn’t already exist, this command creates that file by default.
```bash
# assume that 'newfile' dosen't exitst so touch will create it
touch newfile
```
4. `cp` copying a file
```bash
# assume that the file is named file and you want to copy it to the Downloads      folder
# so you will write ==> cp {the file location} {destination}
cp file ~/Downloads 
# you can also use it for copying the file and renaming it by adding at the end    a file name 
cp file ~/Downloads/newfile
```
5. `mv` moving a file
```bash
# it moves the file to a specific location
mv file ~/Downloads
# you can use it also for renaming but unlike the copy, because the the copy       moves the data of the orginal file to another file with different name in a      different location and keeps the original, the move command moves the data to    another file with another name in another location and delete the original
# to move the file
mv file ~/Downloads
# to rename the file
mv file newfile
```
6. `rm` and `rmdir` remove a file, remove a directory
```bash
# rm {file_location}
rm file
# remove an empty directory
# rmdir {folder_location}
rmdir ~/folder/
# to remove a direcory that has data in it use this
rm -r ~/full_folder/
# *note* use the previous command carefully because you can delete important       files easly 
```
