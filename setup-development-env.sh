#!/usr/bin/env bash
sudo apt update

sudo apt install git zsh neovim tmux curl unzip

# install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh plugins
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

wget -O ~/.zshrc https://gist.githubusercontent.com/cdimitroulas/9d1238ce5042fde3cf800402d1f1e706/raw/d18ea824d2e3b29cedbcbf0222b90ea8abf37eb5/.zshrc

wget -O ~/.tmux.conf https://gist.githubusercontent.com/cdimitroulas/7071ad7ac8207614f7923fbce68107b3/raw/dc7a8f5ee316319512b753db1c6a1797134271cb/.tmux.conf

wget -O ~/.config/nvim/init.vim https://gist.githubusercontent.com/cdimitroulas/1fc96b09612fd4c0248168de3427183c/raw/d602320bc5662e58f040e3aea8de3e4f0476237c/init.vim

wget -O ~/.bashrc https://gist.githubusercontent.com/cdimitroulas/fa1288922256622882cbcc70341a302f/raw/d5a1ca0967cd973a6d01e46c5ac3c924061a47d4/.bashrc

wget -O ~/.gitconfig https://gist.githubusercontent.com/cdimitroulas/1d17e54853583a1b9aa04ff6ee428524/raw/84385b7f37320de1b86206db05fb73e3fbf1ff01/.gitconfig

# Setup awesome git scripts
wget -O ~/Software/git-number/1.0.1.zip https://github.com/holygeek/git-number/archive/1.0.1.zip && unzip ~/Software/git-number/1.0.1.zip && \
  sudo ln -s ~/Software/git-number/1.0.1/git-number /usr/bin/git-number && \
  sudo ln -s ~/Software/git-number/1.0.1/git-id /usr/bin/git-id && \
  sudo ln -s ~/Software/git-number/1.0.1/git-list /usr/bin/git-list



# Use Neovim for some of the editor alternatives
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Install Docker
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  # TODO automate docker download fingerprint verification somehow?
  # sudo apt-key fingerprint 0EBFCD88 | grep "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io && \
  sudo usermod -aG docker $USER && \
  # Install docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  sudo chmod +x /usr/local/bin/docker-compose
