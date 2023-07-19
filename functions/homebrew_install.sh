function install_homebrew_and_libraries {
  print_info "installing homebrew..."
  if command -v brew >/dev/null 2>&1; then
    brew_command update
    brew_command doctor
    brew_command prune
    brew_command cleanup
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
     (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  print_info "start brew install..."
  brew bundle --file ~/.config/brewfile/Brewfile

  # sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
}
