This repository stores the configuration files I use across different
platforms and environments. It also contains a program called `Dotfiles.java`
which installs the files on the currently running platform.

*   The `platforms/` directory contains one subdirectory per platform.
*   In a platform directory, two plain text files can be used to control how
    `Dotfiles.java` installs dotfiles:
    -   `extend.txt` (optional) contains a list of other platform names whose
        dotfiles we should copy in first when building this platform
    -   `build.txt` (optional) contains a list of files or directories in the
        platform directory that should be included in the build
*   `extend.txt` allows you to share dotfiles across two dissimilar platforms
    (e.g., sharing a config for one shell across Windows and Linux).
*   `build.txt` allows you to omit some files or directories from the build
    without deleting them.


## Usage

Running `Dotfiles.java` with no arguments shows the following usage information:

```text
> javac Dotfiles.java && java Dotfiles
A program that manages dotfiles across different platforms.
usage: java Dotfiles build      Build dotfiles for current platform into build/
       java Dotfiles install    Build, then copy into platform-appropriate place
       java Dotfiles update     Download latest dotfiles via GitHub API
version: 0.0.1 (https://github.com/abreen/dotfiles/releases/0.0.1)
current platform: ubuntu22.04, ubuntu, linux
build.ini: 3 variables - GitHub URL: https://github.com/abreen/dotfiles
```

`Dotfiles.java` installs dotfiles by copying files and directories into the
appropriate user-specific directory for the platform (e.g., `$HOME` on Linux).

You'll need an Internet connection to use the `update` command, but you don't
need a copy of Git. The `build.ini` file contains the name of the GitHub
repository to download from.


## Platforms

`Dotfiles.java` uses the Java standard library to determine the current
platform. The platform specifier for a machine running version 35 of Fedora
Linux would be: `fedora35, fedora, linux` and the specifier for a Mac running
macOS Monterey would be: `macos12, macos`.

See below for all known platform names and their versions.

```text
├── haiku
├── unix
│   ├── linux
│   │   ├── android(5,6,7,8,9,10,11,12,13)
│   │   ├── alpine
│   │   ├── arch(2022.11.x,2022.12.x,2023.01.x)
│   │   ├── centos
│   │   ├── chromeos
│   │   ├── crunchbang
│   │   ├── fedora(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,
│   │   │          24,25,26,27,28,29,30,31,32,33,34,35,36,37,38)
│   │   ├── kubuntu(11.04,11.10,12.04,12.10,13.04,13.10,14.04,14.10,15.04,15.10,
│   │   │           16.04,16.10,17.04,17.10,18.04,18.10,19.04,19.10,20.04,21.10,
│   │   │           22.04,22.10)
│   │   ├── redhat(3,4,5,6,7,8,9)
│   │   ├── scientific
│   │   └── ubuntu(11.04,11.10,12.04,12.10,13.04,13.10,14.04,14.10,15.04,15.10,
│   │              16.04,16.10,17.04,17.10,18.04,18.10,19.04,19.10,20.04,21.10,
│   │              22.04,22.10)
│   └── macos(10.6,10.7,10.8,10.9,10.10,10.11,10.12,10.13,10.14,10.15,11,12,13)
└── windows(7,8,8.1,10,11)
```

## Building dotfiles

For a platform specifier like `ubuntu19.10, ubuntu, linux` there could be
three different subdirectories of `platforms/` containing dotfiles
that should be part of the build.

```text
├── Dotfiles.java
├── platforms/
│   ├── linux/
│   │   ├── bash/
│   │   │   ├── .bashrc
│   ├── ubuntu/
│   │   ├── bash/
│   │   │   ├── .bashrc
│   ├── ubuntu19.10/
│   │   ├── bash/
│   │   │   ├── .bashrc
│   ├── macos/
│   │   ├── extend.txt
│   │   ├── bash/
│   │   │   ├── .bashrc
```

Through the use of an `extend.txt` file, more still can be included for
building. In our example above, what should `.bashrc` contain for a machine
running Ubuntu 19.10? What about for macOS if the `extend.txt` file contains
`ubuntu19.10`?

The answer: `Dotfiles.java` uses an **increasing specificity**, **append-only**
approach to this problem.

*   To build for the platform `ubuntu19.10`, `Dotfiles.java` will first build
    the files in `linux`, then append to those files with the content in
    `ubuntu`, then append again with the content in `ubuntu19.10`.
*   To build for the platform `macos`, `Dotfiles.java` looks at the `extend.txt`
    file and sees that it contains `ubuntu19.10`, so that platform is first
    built recursively (using increasing specificity, append-only) and then
    lastly the `macos` content is appended.

Beware that this approach may not be compatible with the format of some
configuration files (e.g., JSON), although future support for merging data
of specific file types may be added to `Dotfiles.java`.


## Variables and secrets

Since `Dotfiles.java` reads the contents of dotfiles into memory in order to
append during the build, it also processes each line for simple variable
substitutions. Variables written in the form `%foobar%` will be replaced via
string substitution with definitions in the `build.ini` file and the
optional `secrets.ini` file.

For example, if the `build.ini` file contained the line `foobar=123` then any
configuration file containing the sequence `%foobar%` will be replaced
with `123` before being copied to the build directory.

The `secrets.ini` file is processed the same as the `build.ini` file.
It is intended for storing passwords or secret keys that can later
be referenced by dotfiles (e.g., to inject the key into an environment
variable). This way you can use Git to manage the dotfiles code that uses the
secret without directly committing the secret's value to the repository.

`secrets.ini` is listed in this repository's `.gitignore` file. It should never
be checked into a version control system.

`build.ini` is required because it contains GitHub repository details
for the `update` command.


## Using company-loaned machines

Here's my personal workflow when setting up a new company-owned machine:

1.  Install [SDKMAN!](https://sdkman.io/)
2.  Download [`Dotfiles` zipball](https://github.com/abreen/Dotfiles/archive/refs/heads/main.zip)
3.  Add new directories to an existing platform but do not add the new
    directories to Git
4.  Use `secrets.ini` for secrets, keys, passwords, and tokens and reference
    them by variable name in the dotfiles

`Dotfiles.java` will pick up the new dotfiles automatically on the next build.
The strength of this approach is that you never need to write code that
imperatively includes another configuration file, and you can still use
the `update` command to retrieve changes without dealing with merge conflicts.