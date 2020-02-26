# if ctags is not installed alread. Configure this line depending on your system pre-installed package manager:
sudo dnf install ctags

# install a vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copy a vimrc file
cp ./.vimrc ~/.vimrc

mkdir -p ~/.vim
mkdir -p ~/.vim/plugin
# copy a manualy installed plugins such as:
# code_complete.vim - completing a function paramateres. (using Ctags and for C-language only)
cp ./.vim/plugin ~/.vim/plugin


echo "Do not forget to open vim and type ':PlugInstall' !"
