# About

A simple perl script to sync two folders.
You have to give two directories as cmnd line argument. 
1. If there is a file,folder present in only one of the directories,the script will copy it to the other one.
2. If a file is present in both, it will remove the old file and update the file to the new one in both directories.
3. If a folder is present in both, it will follow the steps 1,2 and 3 for that folder. 

# Usage:-
Download the file sync.pl.
Run:-  perl sync.pl directory1 directory2

# Note That:-
directory1 and directory2 should not be parent and child directories or vice-versa.
You should run the script from outside directory1 or directory2.
