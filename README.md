# My VIM Config

## For NeoVim (.lua config file)


1. Install Plugin Manager (Packer):

https://github.com/wbthomason/packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2. Get the vim configs (init.lua and lua/ directory containing the rest of the config)

```
git clone git@github.com:CheckmateBasilisk/myvimconfig.git ~/.config/nvim
```

and change the branch to nvim-lua


3. Inside NeoVIM, get plugins using

```
:PackerSync
```

Then do the small fixes:
```
sudo apt install --yes -- python3-venv # for COQ
sudo apt install ripgrep # for Rg
```
inside VIM run :Rg so the prompt to download the fzf binaries show (COQ thing)

## For NeoVim (.vim config file)


1. Install Plugin Manager (Plug):

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Get the vim configs (init.vim)

```
wget https://raw.githubusercontent.com/CheckmateBasilisk/myvimconfig/master/init.vim -P ~/config/nvim

```

3. Inside NeoVIM, get plugins using

```
:PlugInstall
```

## For Vim 

1. Install Plugin Manager (Plug):

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Get the .vimrc

```
wget https://raw.githubusercontent.com/CheckmateBasilisk/myvimconfig/master/.vimrc -P ~/

```

3. Inside VIM, get plugins using

```
:PlugInstall
```

## Useful commands

open vim config file (works with nvim)
```
:e $MYVIMRC
```

reload vim config
```
:source $MYVIMRC
```



## Additional Resources

Lua Config Files NeoVim
https://youtu.be/hY5-Q6NxQgY

Plugin Management NeoVim
https://youtu.be/gd_wapDL0V0
