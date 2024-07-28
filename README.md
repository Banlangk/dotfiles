# Dotfiles

This repository contains my personal configuration files for different environments. These configurations are tailored for my own use and may not be suitable for others. If you like, you can clone this repository to your local machine and follow the steps below to push it to your own dotfiles repository.

## Usage

To use these configuration files, please refer to the appropriate branch for your system.

### Deploying on a New Machine

To set up these dotfiles on a new machine, follow these steps. Ensure you have Git installed on your system.

#### 1. Clone the Repository

Clone the repository as a bare repository:

```sh
git clone --bare https://github.com/banlangk/dotfiles.git $HOME/.dotfiles
```

#### 2. Define the `dotfiles` Function

Add the `dotfiles` function to your shell configuration file:

- **Bash/Zsh**:

  ```sh
  echo "function dotfiles { /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME \$@; }" >> ~/.bashrc
  source ~/.bashrc
  ```

  For Zsh, replace `~/.bashrc` with `~/.zshrc`.

- **Fish**:

  ```sh
  echo "function dotfiles; /usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME \$argv; end" >> ~/.config/fish/config.fish
  source ~/.config/fish/config.fish
  ```

- **PowerShell**:

  ```powershell
  echo "function dotfiles { git --git-dir=$HOME\.dotfiles --work-tree=$HOME \$args }" >> $PROFILE
  . $PROFILE
  ```

#### 3. Fetch and Checkout the Appropriate Branch

Fetch the latest changes and checkout the appropriate branch:

```sh
dotfiles fetch
```

- **Linux**:

  ```sh
  dotfiles checkout linux
  ```

- **Windows**:

  ```powershell
  dotfiles checkout windows
  ```

#### 4. Configure Git to Ignore Untracked Files

Configure Git to not show untracked files:

```sh
dotfiles config --local status.showUntrackedFiles no
```

### Push to Your Own Repository

If you want to push these dotfiles to your own remote repository, follow these steps:

1. Add your own remote repository URL:

    ```sh
    dotfiles remote set-url origin https://github.com/yourusername/your-dotfiles-repo.git
    ```

2. Push the specific branch to your own remote repository:

    ```sh
    dotfiles push origin <branch_name>
    ```

For example, if you want to push only the `linux` branch:

```sh
dotfiles push origin linux
```

This will create a `linux` branch in your remote repository, and it will not have a `windows` branch unless you explicitly push it.

### Example of Adding Dotfiles

To add new dotfiles to the repository, use the following steps:

1. Add the file:

    ```sh
    dotfiles add <path_to_file>
    ```

2. Commit the changes:

    ```sh
    dotfiles commit -m "Add <file_name>"
    ```

3. Push the changes to the remote repository:

    ```sh
    dotfiles push origin <branch_name>
    ```

By following these instructions, you can ensure that your dotfiles are correctly synchronized and deployed on both Linux and Windows environments.

Feel free to adjust the content according to your specific needs and environment.
