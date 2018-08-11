
# Linux

## Part 2

### Shell 
- The Shell is the default interface to a Linux system. 
- If you're on the graphical interface, you'll need a terminal emulator application to interact with the shell, which is basically Terminal.
- The GUI on Linux is also a shell, it's called a graphical shell. However, if somebody says shell, they're usually talking about the CLI. 
- The tilde by itself represents the current accounts home directory. For example, `~George = /home/George`, `~ftp = /srv/ftp`, or  `~root = /root`

### The Most Common File Directory
- `/`, aka "root" or "slash", is the top of the file system hierarchy.
- `/bin`, is where you find binary or executable files. Programs are written in source code which is human-readable text. These text files are then compiled into machine readable binaries, which is a string of 0s and 1s.
- `/etc`, or "etsy", is where you'll find system configuration files. Configuration files control how the OS or an application behaves.
- For example, there is a config file in `/etc` that tells the OS to boot in text mode or graphical mode.
- `/home`, is where you separate data in your account from data in a separate account, because Linux systems can have multiple users or multiple user accounts. For example `/home/George/Documents`, or `/home/George/Downloads`. You can store anything in your home directory. 
- `/opt` is optional or third party sofware. 
- `/tmp` is for temporary space. Most Linux distros will clear `/tmp` at boot time. 
- `/usr` is where user-related programs live. For example, you'll find subdirectores in `/usr`, such as `/usr/bin` or `/usr/lib`.
- `/var` is for variable data, things that change often. On a Linux system, things that change often are log files generated either by the OS itself or applications. Log files will probably be stored in `/var/log`.
- Applications that are not shipped or a part of the base OS will likely be installed in `/usr/local` or `/opt`.

### SSH

- If you're going to connect to a Linux system over the network, you'll more than likely use SSH (Secure Shell), Windows - PuTTY, or Mac - Terminal/ssh command line utility.
- SSH is a network protocol. It's primary purpose is to allow you to connect from one system to another system securely over a network.
- In the past, you would use Telnet. SSH has replaced Telnet as its more secure counterpart. Telnet is obsolete today, but may encounter Telnet in legacy systems.

- In order to connect to Linux over the network, you will need a terminal emulator that also acts as a SSH client. For Windows, the most popular SSH client and emulator is `PuTTY`. 

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