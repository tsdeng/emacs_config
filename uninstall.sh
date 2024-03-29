# Delete bootstrap code in ~/.emacs

sed -i.old '/BEGIN load custom emacs_config.org/,/END load custom emacs_config.org/d' ~/.emacs

# Remove symbols links
if [[ -L ~/.emacs.d/emacs_config.org ]]; then
    rm ~/.emacs.d/emacs_config.org
fi

if [[ -L ~/.emacs.d/elisp ]]; then
    rm ~/.emacs.d/elisp
fi

if [[ -L ~/.emacs.d/snippets ]]; then
    rm ~/.emacs.d/snippets
fi
