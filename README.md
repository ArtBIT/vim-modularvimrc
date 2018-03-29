# Modular .vimrc loader
:Author: Djordje Ungar <gmail@djordjeungar.com>

This is a simple plug-in for Vim (and NeoVim) that auto loads directory specific `.vimrc` config. 

Say you have a project specific list of plugins that you wish to use, or per project build tools, or snippets or keyboard shortcuts, or simply a project specific `.vimrc` file that you wish to share amongst the team, this plugin allows you to do that.

## Installation

The easiest way to install the plugin is to install it as a bundle.
For example:

### Using [Pathogen](https://github.com/tpope/vim-pathogen):
```
cd ~/.vim/bundle
git clone git://github.com/ArtBIT/vim-modularvimrc.git
```

### Using [VimPlug](https://github.com/junegunn/vim-plug):

```
Plug 'ArtBIT/vim-modularvimrc'

```

### Or manually
```
cd /tmp && git clone git://github.com/ArtBIT/vim-modularvimrc.git
cp -r vim-modularvimrc/* ~/.vim/
```

## Config

Plugin assumes that the config files are named `.vimrc`, if you want to change it to say, `.vimconfig` add the following line to your `.vimrc`:
```
let g:modularvimrc#filename = ".vimconfig"
```

# LICENSE
[MIT](LICENSE.md)
