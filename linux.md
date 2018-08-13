
# Linux

## Part 3

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

- env variables store information (i.e. `PATH` is an environment variable). Knowing the `PATH` env variable gives you an idea of where commands are located on the Linux system.
- PATH controls the command search path, meaning that when you type in a command in the prompt, that command will be searched for in the directories that are listed in your path environment variable. For example, type `echo $PATH` to provide a list of directories separated by a colon. `/usr/local/bin` will be searched first. If command is found there, it will be executed. If command is not found, then the next directory will be searched. If all the directories in the environment variable have been searched, then `command not found` is returned in the prompt.
- stores location that has a name and a value as a pair.
- typically uppercase
- access env variables by executing `echo $VAR_NAME`.
- If you want to know the full path to the command you are executing, use the `which` command (i.e. `which cat`). If there are multiple programs named `cat`, then the one that gets executed is the one that appears first during the command search in the environment variable. (i.e. `which tac` displays the files contents in reverse order).
- Add `--help` or `-h` to a command to get help. Some commands will not have help. In this case, you can use `man pages`.
- Search on man pages using `man -k <INSERT SEARCH TERM>`.

### Part 3 RECAP

- Man is the command used to display the documentation that is build into the Linux system.
- The $PATH controls your search path, and can determine which commands get executed. Use `which <INSERT COMMAND>` command to learn full path to a command.
- You can `cd` into any search paths from whatever path you're currently on (i.e. `echo $PATH` to show search paths, then `cd /bin` or `cd /usr/local/bin`)

## Part 2

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



## Part 1

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