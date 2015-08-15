@echo Off
rem -- Install Vim Plugins using Pathogen
rem -- MUST be installed in %UserProfile%\vimfiles

rem -- Sync of all Git modules (
rem -- see http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
rem -- git submodule foreach git pull origin master

set VIM_DIR=%USERPROFILE%\vimfiles
set VIM_EXE_DIR=C:\Program Files\Vim\vim74
if exist "%VIM%\vim74\gvim.exe" set VIM_EXE_DIR=%VIM%\vim74
if exist "%VIMRUNTIME%\gvim.exe" set VIM_EXE_DIR=%VIMRUNTIME%

if exist "%VIM_EXE_DIR%\gvim.exe" goto HaveVim
echo "%VIM_EXE_DIR%\gvim.exe" not found
goto eof

:HaveVim
cd %VIM_DIR%
copy _vimrc ..

git submodule add http://github.com/scrooloose/nerdtree.git bundle/nerdtree
git submodule add http://github.com/scrooloose/syntastic.git bundle/syntastic
git submodule add http://git.wincent.com/command-t.git bundle/command-t
git submodule add http://github.com/bling/vim-airline.git bundle/vim-airline
git submodule add http://github.com/mattn/emmet-vim.git bundle/emmet-vim
git submodule add http://github.com/jceb/vim-orgmode.git bundle/vim-orgmode
git submodule add http://github.com/tpope/vim-surround.git bundle/vim-surround
git submodule add http://github.com/tpope/vim-commentary.git bundle/vim-commentary
git submodule add http://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git submodule add http://github.com/vim-scripts/supertab.git bundle/supertab
git submodule add http://github.com/edkolev/tmuxline.vim.git bundle/tmuxline.vim
git add .
git commit -m "Install VIM bundles as a submodule"
:eof
cd ..