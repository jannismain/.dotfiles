# `.dotfiles`

* I'm using [zsh4humans](https://github.com/romkatv/zsh4humans) as a base configuration
* I provide a [setup script](./setup/setup) for easy... setup
* I manage my `brew` packages using a [`Brewfile`](./private/Brewfile)
* I link my dotfiles (e.g. `.zshrc`) into `~`
* I keep custom configurations per tool / use case in separate files in `./src`
* I keep helper scripts in [`./bin`](./bin) and add it to my PATH
* I keep private configuration and scripts in a [`private submodule`](./private)

## Getting Started

```console
git clone --recurse-submodules --remote-submodules https://github.com/jannismain/.dotfiles ~/.dotfiles
cd ~/.dotfiles
make
```
