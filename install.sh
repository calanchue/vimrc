# install vimrc file and vundle and vundle plugins
echo copy vimrc
cp ./.vimrc ~/.vimrc
echo copy vimrc finished

echo copy vimrc
cp ./.tmux.conf ~/
echo copy vimrc

echo vundle install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo vundel install finished

echo vundle plugininstall
vim +PluginInstall +qall
echo vundle plugininstall finished

echo youcompleteme requirement
sudo apt-get install build-essential cmake
sudo apt-get install python-dev
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
echo youcompleteme requirement finished
