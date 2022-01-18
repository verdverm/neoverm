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

NERDTree:

- `<F3>` to toggle NERDTree
- `,nf` to locate current buffer in NERDTree
- `s` from NERDTree to open file in new split

Tools:

- `,tt` for a terminal
- `,lg` for lazygit
- `,ld` for lazydocker


