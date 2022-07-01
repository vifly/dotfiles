# dotfiles

My dotfiles controlled by GNU stow following [this way](https://farseerfc.me/using-gnu-stow-to-manage-your-dotfiles.html).

## Notes
### Zsh
After clone this repository, don't forget to run:

```Bash
git submodule init
git submodule update --recursive
```

Restart zsh or run `source ~/.zshrc` in your current zsh, then run:

```Bash
zinit update --all
```

To use zsh-histdb, sqlite is required:

```Bash
sudo pacman -S sqlite
```

And I recommend installing the following software:

```Bash
sudo pacman -S bat prettyping exa fd ripgrep
```

### Cargo
To reduce link time, mold is required:

```Bash
sudo pacman -S mold
```
