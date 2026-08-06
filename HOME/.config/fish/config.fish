if status is-interactive
    # Commands to run in interactive sessions can go here
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function fish_user_key_bindings
    bind ! bind_bang
end

set -xg PAGER "bat --wrap=never"
set -xg CONFIG_DIR "$HOME/.config/fish"
set -xg EDITOR nvim
set -xg NODE_USE_SYSTEM_CA 1

if [ -f "$CONFIG_DIR/work_variables.fish" ]
    . "$CONFIG_DIR/work_variables.fish"
end

if [ -f "$CONFIG_DIR/aliases.fish" ]
    . "$CONFIG_DIR/aliases.fish"
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/corythompson/google-cloud-sdk/path.fish.inc' ]
    . '/Users/corythompson/google-cloud-sdk/path.fish.inc'
end

# pnpm
set -gx PNPM_HOME /Users/corythompson/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

abbr -a -- gpf 'git push origin +HEAD'
abbr -a -- gst 'git status'
abbr -a -- gd 'git diff'
abbr -a -- gs 'git switch'
abbr -a -- gl 'git log'
abbr -a -- gr git rebase
abbr -a -- gri git rebase -i
abbr -a -- ga git add
abbr -a -- gc git commit
abbr -a -- gca git commit --amend
abbr -a -- gcm git commit -m
abbr -a -- xdar 'cd /Users/corythompson/Projects/x-darwin'
abbr -a -- gcer git commit -m \"ephemeral reset\" --allow-empty
abbr -a -- xreset 'pnpm dev:reset; and pnpm dev:tp'
abbr -a -- sr 'source ~/.config/fish/config.fish'
abbr -a -- c 'clear; and tmux clear-history'
abbr -a -- xdeps 'pnpm --filter @mantl/tooling start-backbone-dependencies'
abbr -a -- cdx cd ~/Projects/mantl-tree

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
export PATH="$HOME/.local/bin:$PATH"
