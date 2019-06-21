# 1. Copy emacs_config.org to ~/.emacs.d
if [ ! -d ~/.emacs.d ]; then
    echo "~/.emacs.d does not exist, creating one..."
    mkdir ~/.emacs.d
fi

ln -Fs $(pwd)/emacs_config.org ~/.emacs.d/emacs_config.org

# 2. modify .emacs to read emacs_config.org

if [ ! -f ~/.emacs ]; then
    echo "~/.emacs does not exist, creating one..."
    touch ~/.emacs
fi

CONTENT='(org-babel-load-file "~/.emacs.d/emacs_config.org")'
# -F means fixed string, -x means exactly match whole line. -q means quiet.
if ! grep -Fxq "$CONTENT" ~/.emacs; then
    echo "'~/.emacs/' is not loading emacs_config.org, updating... "
    # using printf here because BSD's echo does not recognize \n.
    # https://lists.freebsd.org/pipermail/freebsd-questions/2011-December/236645.html
    printf "$CONTENT\n$(cat ~/.emacs)" > ~/.emacs
fi

