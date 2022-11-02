# bmark

This is a terminal program used to mamke switching between commonly used directories easy!

## Installation

```bash
# clone repo
git clone https://github.com/GComputeNerd/bmark.git
cd bmark

# To run the program 
source bmark
# If you don't source it the directory won't change.
```

If you want to use the program from anywhere, add an alias to ur `~/.bashrc` or `~/.bash_aliases` file.

```bash
# ~/.bash_aliases
alias bmark="source ~/path/to/file/bmark"
```

Now you can run the command by typing `bmark` in terminal.

## Usage

### Links

bmark searches the `bmark/links` folder for soft links. To make a soft link go to the bmark/links folder and run the following command.

```bash
ln -s ~/path/to/folder NameOfLink
```

So to make a soft link for the Downloads folder, do

```bash
ln -s ~/Downloads Downloads
```

Now if we run the `bmark` command, we should see.

[Insert Image Here]
