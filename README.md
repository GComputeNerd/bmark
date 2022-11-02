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

If we want to group links into folders (example :- we want to have a Programming category, which has links to your C, or lua folder).

Then we have to do the following

```bash
cd links
mkdir Programming
cd Programming
ln -s ~/Programming/C C
ln -s ~/Programming/lua Lua
```

so now our links folder should be like this.

```
bmark/links/
|----Downloads
|----Programming
     |----C
     |----Lua
```

Now, if we run `bmark`, we should see.

[Insert Image Here]

and if we click on Programming, we should see.

[Insert Image Here]

Now you should be able to make your own set of bookmarks, you can nest folders if you want to as well.

An additional note, say you want to have a Programming bookmark that links to `~/Programming` then you can do the following.

```bash
cd links
cd Programming
ln -s ~/Programming .main
```

Now if we run `bmark` and go to programming, we can see a `root` option, clicking this will take us to `~/Programming`

[Insert Image Here]

### Running bmark without TUI

bmark can also be run without going to the TUI. Say you just want to go to the `lua` folder directly without opening bmark, clicking on Programming, and clicking on Lua. Then we can also go to the lua folder by typing the name of the soft link directly like this.

```bash
bmark Lua
```

When we type this, bmark will scan the `bmark/links` folder, and subfolders searching for soft links with the name `Lua`, if one is found, it'll directly go there.

There is also one more added functionality to bmark, if you run

```bash
bmark r
```

it will source your `~/.bashrc`

