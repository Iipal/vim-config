# if ctags is not installed alread. Configure this line depending on your system pre-installed package manager:
echo " Installing ctags"
sudo dnf install ctags
echo " "

# install a vim-plug
echo " Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo " "

echo " Generating default tags via Ctags"
mkdir -p ~/.vim
ctags -R --c-kinds=+p --fields=+S /usr/include
mv tags ~/.vim/tags
echo " "

# copy a vimrc file
echo " Copying ./.vimrc"
cp ./.vimrc ~/.vimrc
echo " "

# copy a ctags file
echo " Copying ./.ctags"
cp ./.ctags ~/.ctags
echo " "

echo " Installing plugins"
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/plugin
# copy a manualy installed plugins such as:
#
# code_complete.vim - completing a function paramateres. (using Ctags and for C-language only)
echo " "
echo "  Installing code_complete.vim"
curl -fLo ~/.vim/plugin/code_complete.vim https://raw.githubusercontent.com/vim-scripts/code_complete/master/plugin/code_complete.vim 
# CtrlP - Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
echo " "
echo "  Installing CtrlP"
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
echo " "

echo " !!! Do not forget to open vim and type ':PlugInstall' !!!"
