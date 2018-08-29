# Linux

## Part 7: Finding Files and Directories 

- `find [path] [expression]` recursively find files in path that match expression. If no arguments are provided it finds all files in current directory and its subdirectories.
- 


## Part 6: Groups and Permissions

- New files created are auto set to your primary group.
- `chgrp` command changes the group. For example `chgrp sales sales.data` will change group of `sales.data` file to `sales`.
- `chmod g+w sales.data`

### Change Permission Commands

- Permissions are also known as modes. `chmod` is the command to and is short for "change mode". For example, `chmod g+w sales.data`. This will add write permission to group. To undo or remove that permission, `chmod g-w sales.data`. Another example to change permission to multiple categories in one command, `chmod u=rwx, g=rx, o= sales.data`. If you don't specify a permission after the equal sign, then all permissions are removed from that category (i.e. other group in previous example). `a=r sales.data` will set all categories to read.
- `ugoa` represents the 4 different permission categories.
- `+-=` is to add, subtract, or set permissions.
- `rwx` is read, write, execute.

- Numeric based permissions are always in read, write, execute order. And user group category is always in user, group, other order.
- To get a number to use with `chmod`, convert binary to base 10 or decimal. Read=4, write=2, execute=1.
- If r,w,x are all set to off, the binary representation is `000`. If you omit the write permission, then binary is `101`.
- For example, symbolic `-rwx------` or octal `700` means only user has `rwx` access to the file, and no one else.
- Another example: symbolic `-rwxr-xr-x` or octal `755` means everybody on the system can execute the file, but only the user or owner can edit that file.
- Third example: symbolic `-rw-rw----` or octal `660` allows only the user and members of the group to read and edit that file, and does not let others read it.
- In general its best to avoid `777` or `666` permission modes.

- Octal mode has 8 possible values from 0 to 7.
- Octal | Binary | String | Description
-   0   |   0    |   ---  | no permissions
-   1   |   1    |   --x  | execute only
-   2   |   10   |   -w-  | write only
-   3   |   11   |   -wx  | write and execute (2+1)
-   4   |   100  |   r--  | read only 
-   5   |   101  |   r-x  | read and execute (4+1)
-   6   |   110  |   rw-  | read and write (4+2)
-   7   |   111  |   rwx  | read, write, and execute (4+2+1)

### Permissions and Groups

- `-rw-r--r--`. **The first character in permission string reveals file type.** For example `-` is a regular file, `d` is directory, and `l` is a symbolic link.
- If you have read permissions (`r`), you can run `cat` on the file. If you have write permissions, you can modify its contents.
- Permissions with directories are slightly different than permissions with files.
    - Read to a directory means you can see the file names in the directory. If you don't have read permissions to a directory, you won't be able to see directory's content.
    - Write to a directory allows entires to be modified within the directory. So you can edit files that are in the directory.
    - Execute allows you to see metadata of the files in the directory, such as modification dates, owner, and group information. Similar to what you would see in a `ls -l` long listing output.

- Permission categories: `User, Group, Other, All`, are represented by symbols `u, g, o, a`, respectively.
- `u` represents the user that owns the file.
- The users in the files group are represented by `g`.
- `o` represents user that is not the owner or in the files group, are considered `other`.
- `a` represents all, or everybody.

- Every user is in at least one group. Users can belong to many groups. Groups are used to organize users.
- Run `groups` or `id -Gn` to see what groups you are a member of. Or run `groups <insert another user>` to see which groups that user belongs to.

## Part 5: ls Command

- `-rw-r--r--  1 vuo5583  staff   1204 Aug 13 12:21 network.tf`. First set are the permissions, second is the number of links to that file or directory. **third is the owner of the file, fourth is what group the file belongs**, fifth is size of the file, sixth is the last time the file was modified, and lastly, is the filename itself.
- `ls -a` to show hidden files.
- `ls -l -a` = `ls -la` = `ls -al` shows the long listing output that includes hidden files. `l` stands for long listing output, and `a` stands for all files.
- `ls -F` reveals file types. If it ends in `/`, then it's a directory, `@` is a link, and `*` is an executable.
- Symbolic link (or symlink) is a pointer to the actual file or directory. A symlink can be used to create shortcuts for long file or directory names, or to indicate the current version of software.
- `ls -lF` displays the long listing output with file.
- `ls -t` to list files by time.
- `ls -r` to list files in reverse order. `ls -l` sorts the list by name in order. 
- `ls -latr` long listing including all files reversed sorted by time.

## Part 4: Directories

### Executing Commands

- Remember that `$PATH` determines the command search path. This means that the `$PATH` environment variable is where the shell will look for commands.
- **You can execute a command with a full path, or execute a command not within `$PATH` environment variable.** For example, `/home/jason/my-cat/cat` will run a different `cat` command because said directory is not within `echo $PATH`.
- `./command` = Executes command in current directory.
- `cat sales.data` is the same as typing the full path, `/bin/cat sales.data`, assuming that `which cat` shows that `cat` is located in `/bin/cat`.
- `mkdir` creates a directory. `-p` is optional and stands for parents. This means that if you enter `mkdir -p 1/2/3`, then 3 directories are made with one command.
- `rmdir` only removes empty directories, with no file contents.
- `rm -rf <directory_name>` will recursively delete all the files and directories in that directory and below that directory.
- In Linux command line, there is no undo, there is no trash can to retrieve a file that you've deleted. When you delete something, it's gone.


### Directories

- `.` represents current directory, the current directory (i.e. `./runPublisher.sh`, where `.` means this directory, `/` is the directory separator)
- `..` is the parent directory of the current directory
- `cd -` then you'll be placed in your previous directory. For example, you can `echo $OLDPWD` to see the previously directory you were in, then `cd -` to enter that previous directory.
- `/` is the directory separator (forward slash). For example, if you `cd /home/George`, that's the same thing as running `cd /home/George/`.

## Part 3: Environment Variables

### Basic Linux Commands

- Linux commands are case-sensitive.
- `cd` without any arguments will bring you to home directory.
- `pwd`, displays the present working directory.
- `cat`, displays content of file.
- `echo`, displays arguments to the screen. In other words, `echo` is used to display the content of variables.
- `man`, displays the online manual. Linux comes with built in documentation. Also referred to "man pages". (i.e. `man ls`). Within man pages:
    - `spacebar` moves down to an entire screen or page a time
    - `return` moves down one line
    - `g` moves to top of page
    - `shift + G` moves to bottom of page
    - `q` to quit man page
- `exit`, exits the shell or your current session.

### ls Options

- `-l` displays long listing format, to provide more info about the files and directories.

### PATH Environment Variable

- env variables store information (i.e. `$PATH` or `$OLDPWD` is an environment variable). Knowing the `$PATH` env variable gives you an idea of where commands are located on the Linux system.
- PATH controls the command search path, meaning that when you type in a command in the prompt, that command will be searched for in the directories that are listed in your path environment variable. For example, type `echo $PATH` to provide a list of directories separated by a colon. `/usr/local/bin` will be searched first. If command is found there, it will be executed. If command is not found, then the next directory will be searched. If all the directories in the environment variable have been searched, then `command not found` is returned in the prompt.
- stores location that has a name and a value as a pair.
- typically uppercase
- access env variables by executing `echo $VAR_NAME`.
- If you want to know the full path to the command you are executing, use the `which` command (i.e. `which cat`). If there are multiple programs named `cat`, then the one that gets executed is the one that appears first during the command search in the environment variable. (i.e. `which tac` displays the files contents in reverse order).
- Add `--help` or `-h` to a command to get help. Some commands will not have help. In this case, you can use `man pages`.
- Search on man pages using `man -k <INSERT SEARCH TERM>`.
- `echo $OLDPWD` environment variable holds the old directory you were previously in.

### Part 3 RECAP

- Man is the command used to display the documentation that is build into the Linux system.
- The $PATH controls your search path, and can determine which commands get executed. Use `which <INSERT COMMAND>` command to learn full path to a command.
- You can `cd` into any search paths from whatever path you're currently on (i.e. `echo $PATH` to show search paths, then `cd /bin` or `cd /usr/local/bin`)

## Part 2: Shell 

### What is the Shell?

- The Shell is the default interface to a Linux system. The shell is also called a `command line interpreter`.
- If you're logged onto the graphical interface, you'll need a terminal emulator application to interact with the shell, which is basically terminal.
- The GUI on Linux is also a shell, it's called a graphical shell. However, if somebody says shell, they're usually talking about the CLI.
- The shell is nothing more than a program that accepts and executes your commands.
- Server distros do not include GUIs. Desktop distros have GUIs and CLIs. There are command line web browsers that come with Linux, so you can surf the web from the command line.
- The tilde by itself represents the current accounts home directory. For example, `~George = /home/George`, `~ftp = /srv/ftp`, or  `~root = /root`.

### The Prompt

- Example given: `[jason@linuxsvr ~]$`
- The shell prompt typically shows the username (i.e. vuo5583), and the name of the system you are connected to (i.e. Georges-MacBook-Pro).
- `$` at the end of the prompt means you're using the system as a normal user. `#` means you're using the system as a superuser.
- The superuser on a Linux system is also called "root". It's the root account. So when somebody is talking about `root`, it's either the `root` file directory mentioned earlier, or the `root` superuser acct.

### Root, the Superuser

- The root on a Linux system is similar to an admin acct on a Windows system. Anything done on a Linux system can be done by the root user.
- A normal user can only do a subset of the things root can do, like most day-to-day activities.
- Root access is typically restricted to system admins at a company who are responsible for the upkeep, maintenance, and configurations of Linux servers for example.
- However, if you're using Linux on your desktop, you'll have access to your normal user acct and root acct.
- Root access may be required to install an application outside of your home directory, or start or stop an application (i.e starting a web server).

### The Most Common File Directory

- `/`, aka "root" or "slash", is the top of the file system hierarchy.
- `/bin`, is where you find binary or executable files. Programs are written in source code which is human-readable text. These text files are then compiled into machine readable binaries, which is a string of 0s and 1s.
- `/etc`, or "etsy", is where you'll find system configuration files. Configuration files control how the OS or an application behaves.
- For example, there is a config file in `/etc` that tells the OS to boot in text mode or graphical mode.
- `/home`, is where you separate data in your account from data in a separate account, because Linux systems can have multiple users or multiple user accounts. For example `/home/George/Documents`, or `/home/George/Downloads`. You can store anything in your home directory. 
- `/opt` is optional or third party software. 
- `/tmp` is for temporary space. Most Linux distros will clear `/tmp` at boot time. 
- `/usr` is where user-related programs live. For example, you'll find subdirectores in `/usr`, such as `/usr/bin` or `/usr/lib`.
- `/var` is for variable data, things that change often. On a Linux system, things that change often are log files generated either by the OS itself or applications. Log files will probably be stored in `/var/log`.
- Applications that are not shipped or a part of the base OS will likely be installed in `/usr/local` or `/opt`.

### SSH

- If you're going to connect to a Linux system over the network, you'll more than likely use SSH (Secure Shell), Windows - PuTTY, or Mac - Terminal/ssh command line utility.
- SSH is a network protocol. It's primary purpose is to allow you to connect from one system to another system securely over a network.
- In the past, you would use Telnet. SSH has replaced Telnet as its more secure counterpart. Telnet is obsolete today, but may encounter Telnet in legacy systems.

- In order to connect to Linux over the network, you will need a terminal emulator that also acts as a SSH client. For Windows, the most popular SSH client and emulator is `PuTTY`. 

### Part 2 RECAP 
- The shell is a default UI for the Linux system. You're automatically presented with a shell prompt if you connect to Linux over the network using SSH. 
- Use the terminal application to get to the CLI.
- Shell prompts can vary greatly in appearance.
- Root is the superuser.

## Part 1: Linux OS

- An OS is a collection of software that manages hardware resources and provides an environment where applications run. 
- For example, the OS allows applications to store information, send documents to printers, interact with users.

### Linux OS = Linux Distribution (aka Distro or Flavor)

- **A Linux distribution is a collection of software applications bundled together and distributed as a single operating system + Linux kernel.**
- For example, one Linux distribution might come with one particular web browser installed, while another Linux distribution will come with another web browser installed by default. 
- **Think of a Linux distribution as a curated collection of software** that works well together, but you're more than welcome to user the software and applications that you like best.  
- There are literally hundreds of Linux distros.

### Linux Kernel

- However, what every Linux distro has in common is the Linux Kernel. 
- The `Linux Kernel` is the core, or the heart of the OS. It's the layer that sits between the hardware and applications. In other words, it's the intermediary between software and hardware.  
- **Linux Kernel + Apps = Distro**
- In addition to the Kernel, you need system libraries, GUI, user interfaces, web browsers, email utilities, and other programs to have a useful OS.  
- A Linux distro is the Linux Kernel, and a collection of software that create an OS.

### The two most popular Linux Distros 

- RHEL (RedHat Enterprise Linux) and `Ubuntu` is the most popular Linux distro used in IT departments and professionals. 
- `RedHat Enterprise` requires a paid license, so instead, use `CentOS`, which is a `RedHat Enterprise Linux` derivative that's completely free. It's really RedHat with the branding and logo replaced with CentOS branding. 
- `Redhat` is commonly used in large, traditional companies (i.e. banks, transportation, airlines, telecoms, large retailers, healthcare)
- `Ubuntu` is popular in startups, SaaS, social networks, small ecommerce stores, or any company that relies heavily on cloud computing. 
- If you're just looking to perssonal use, or use Linux for fun, try out Mint, Debian, Mageia, Fedora, openSUSE, Arch Linux, or Slackware. 

### Linux is Linux 
- Linux concepts are universal. Sure, each distro is slightly different, but if you can do something on one distro, you'll most likely be able to figure out how to do it on another distro. 
- This means you can't make the wrong choice! 

### Part 1 RECAP
- **Linux Distro = kernel + software**
- RHEL and Ubuntu
- CentOS = RHEL rebranding/logos