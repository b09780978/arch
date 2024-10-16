FROM archlinux:latest
MAINTAINER b09780978@gmail.com

ENV TERM xterm-256color
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV XDG_CONFIG_HOME /root/.config

WORKDIR /root

COPY .bashrc .
COPY .vimrc .
COPY .zshrc .
COPY .tmux.conf .

# install basic tool
RUN pacman -Syyu --needed base --noconfirm \
&& pacman -S --noconfirm which wget git net-tools \
&& pacman -S --noconfirm bash-completion tmux \
&& pacman -S --noconfirm neovim python-pynvim \
&& pacman -S --noconfirm nodejs npm \
&& pacman -S --noconfirm zsh zsh-completions zsh-syntax-highlighting \
&& mkdir -p ~/.config/nvim \
&& curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
&& git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# install python environment
RUN pacman -S --noconfirm python python-pip \
&& pip install -U pip \
&& pip install requests httpx pyquery node_vm2 beautifulsoup4 lxml ipython uv

RUN chsh -s /bin/zsh \
&& ln ~/.vimrc ~/.config/nvim/init.vim \
&& nvim +PlugInstall +q +UpdateRemotePlugins +q \
&& pacman -Scc --noconfirm

RUN wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf" \
&& mkdir -p ~/.fonts/ \
&& mv "MesloLGS NF Regular.ttf" ~/.fonts/ \
&& zsh -ic "source ~/.zshrc" \
&& chsh -s /bin/zsh

CMD ["/bin/zsh"]
