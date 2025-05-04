# Check if we're inside a tmux session
if [[ -z "$TMUX" ]]; then
  # Start a new tmux session (you can customize the name of the session here)
  tmux new-session -A -s mysession
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/nix/store/jy1g89hgafda3nbsgikmgxx0ifp0arzr-micromamba-1.5.8/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/prabha14039/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
