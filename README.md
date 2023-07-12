# my-nvim-config

Github: https://github.com/kevinliao852/my-nvim-config

![Preview](https://i.imgur.com/yko6JbH.png)


---

## Instructions

Follow the step-by-step instructions to set up this neovim config on your machine.

These steps are tested on Ubuntu 20.04.6.

### Set up Neovim

#### Install binary

Visit Neovim's [release](https://github.com/neovim/neovim/tags), and choose a tag, e.g., `v0.9.1`, then run the following commands:

```bash=
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64 /usr/local/
echo 'PATH=/usr/local/nvim-linux64/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
nvim --version
```

Expected output:

```bash
NVIM v0.9.1
Build type: Release
LuaJIT 2.1.0-beta3

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/__w/neovim/neovim/build/nvim.AppDir/usr/share/nvim"

Run :checkhealth for more info
```

Reference: [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

#### Build prerequisites

The steps illustrated here are only for Ubuntu/Debian. For other platforms, refer to [this](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites).

**Ubuntu / Debian**

```bash=
sudo apt-get install ninja-build gettext cmake unzip curl
```

#### Install from source

```bash=
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Type `nvim --version` in the terminal to verify the neovim is installed:

```bash=
NVIM v0.10.0-dev-400+ge41b2e34b
Build type: RelWithDebInfo
LuaJIT 2.1.0-beta3
Compilation: /usr/bin/cc -O2 -g -Og -g -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wvla -Wdouble-promotion -Wmissing-noreturn -Wmissing-format-attribute -Wmissing-prototypes -fno-common -Wno-unused-result -Wimplicit-fallthrough -fdiagnostics-color=always -fstack-protector-strong -DUNIT_TESTING -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -DNVIM_TS_HAS_SET_MAX_START_DEPTH -I/root/neovim/.deps/usr/include/luajit-2.1 -I/usr/include -I/root/neovim/.deps/usr/include -I/root/neovim/build/src/nvim/auto -I/root/neovim/build/include -I/root/neovim/build/cmake.config -I/root/neovim/src

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/local/share/nvim"

Run :checkhealth for more info
```

For convenience, add the commands to `~/.bashrc` by running the following in your terminal:

```bash=
echo "alias v=nvim" >> ~/.bashrc
source ~/.bashrc
```

---

### Set up Packer

Reference: [packer.nvim](https://github.com/wbthomason/packer.nvim)

```bash=
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

---

### Set up Config

Reference: [my-nvim-config](https://github.com/kevinliao852/my-nvim-config)

```bash=
mkdir -p ~/.config/nvim
git clone --depth 1 https://github.com/kevinliao852/my-nvim-config.git ~/.config/nvim/
```

Type `v` in the command line to enter into the Neovim, then type `:PackerInstall`, and wait a few minutes to have packages installed.

Other dependencies:

C/C++:

```bash=
sudo apt install clangd clang-format
pip install cpplint
```

JavaScript/TypeScript:

```bash=
npm install -g typescript
npm install -g typescript-language-server
```

Python:

```bash=
pip install black pylint pyright
```


Tailwind CSS:

```bash=
npm install -g tailwindcss-language-server
```
