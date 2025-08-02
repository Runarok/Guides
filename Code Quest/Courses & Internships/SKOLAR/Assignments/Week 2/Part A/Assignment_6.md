Assignment6: Command Line Basics
Command Line Navigation: 
Demonstrate how to navigate the file system using basic command-line commands (e.g., cd, ls, pwd) in your preferred command-line interface (Windows Command Prompt or Linux Terminal).
File Manipulation: Create, copy, move, and delete files and directories usingcommand-line commands. 
Provide screenshots of each operation.

The three fundamental commands:
pwd: Prints the working directory. This tells you where you currently are in the file system.
ls: Lists the contents of the current directory. You'll see files and subdirectories.
cd: Changes the directory. This moves you to a different location in the file system.

Check your current location : cd
- Output: C:\Users\YourUserName

List the contents of the current directory : dir
- Output: Directory of C:\Users\YourUserName , ... list of files and directories

Change to the Documents directory : cd Documents

Check your new location : cd
- Output: C:\Users\YourUserName\Documents

List the contents of the Documents directory : dir
- Output: Directory of C:\Users\YourUserName\Documents , ... list of files and directories

Creating a File
- Command: type nul > filename.txt , Creates an empty file named filename.txt.

Creating a Directory
- Command: mkdir directoryname , Creates a new directory named directoryname.

Copying a File
- Command: copy sourcefile.txt destination\copyfile.txt , Copies sourcefile.txt to destination directory as copyfile.txt.

Moving a File or Directory
- Command: move sourcefile.txt destination\ , Moves sourcefile.txt to the destination directory.
- Renaming: move oldname.txt newname.txt

Deleting a File
- Command: del filename.txt , Deletes the file filename.txt.

Deleting a Directory
- Command: rmdir directoryname , Deletes the empty directory directoryname.
