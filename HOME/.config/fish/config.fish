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
