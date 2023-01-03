# neoverm

My NeoVim setup

Checkout [Jumpfiles](https://github.com/hofstadter-io/jumpfiles) for my keystroke shortening setup.

### Installing

You should be able to use this Lua based setup by cloning and linking

```sh
git clone https://github.com/verdverm/neoverm
ln -s $(pwd)/neoverm ~/.config/nvim
```

- Note, I do not have any extra config or dot files for vim in my home dir.
- You may need to run `:PackerInstall` the first time you open nvim.
- You can see the list of plugins by running `:PackerStatus` from within neovim.

I'm running nvim develop build, compiled locally.

```
NVIM v0.7.0-dev+905-gfcf5dd34f
Build type: Debug
LuaJIT 2.1.0-beta3
```

I recommend installing `lazygit` and `lazydocker`

- https://github.com/jesseduffield/lazygit
- https://github.com/jesseduffield/lazydocker


### Usage

The `<leader>` key is comma `,`

Movement:

- You can move between splits with `Ctrl-<hjkl>`, create them the normal way

Completion: `<C-Space>`

NERDTree:

- `<F3>` to toggle NERDTree
- `,nf` to locate current buffer in NERDTree
- `s` from NERDTree to open file in new split
- `,b` for list of files edited this session

Search:

- `,fb` to find in buffer files
- `,fg` to find in all files
- `,ff` to find in file names

Tools:

- `,tt` for a terminal
- `,lg` for lazygit
- `,ld` for lazydocker

Tabs:

- `,v` to retab
- `,c` to toggle tabs / spaces for indent


### Plugins to consider

A list of plugins I've looked at and would like to consider,
but have not had time yet to include

- https://github.com/rcarriga/nvim-notify
- (some spelling / grammar one, need to find again)
  - ? https://github.com/dvdsk/prosesitter.nvim

