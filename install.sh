# 1. Link emacs_config.org to ~/.emacs.d
if [ ! -d ~/.emacs.d ]; then
    echo "~/.emacs.d does not exist, creating one..."
    mkdir ~/.emacs.d
fi

ln -Fns $(pwd)/emacs_config.org ~/.emacs.d/emacs_config.org

# 2. Modify .emacs to read emacs_config.org
if [ ! -f ~/.emacs ]; then
    echo "~/.emacs does not exist, creating one..."
    touch ~/.emacs
fi


# 3. Delete old config if any.
sed -I.old '/BEGIN load custom emacs_config.org/,/END load custom emacs_config.org/d' ~/.emacs

# 4. Add new config bootstrap code.
printf ";;BEGIN load custom emacs_config.org
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq vc-follow-symlinks t)
(org-babel-load-file \"~/.emacs.d/emacs_config.org\")
;;END load custom emacs_config.org\n$(cat ~/.emacs)" > ~/.emacs

# 5. ln elisp folder to ~/.emacs.d/elisp, the -n makes sure if the
# symlink already exists, it does not follow it and create a nested
# link.
ln -Fns $(pwd)/elisp ~/.emacs.d/elisp

