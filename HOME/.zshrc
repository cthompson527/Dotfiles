export PATH=/opt/homebrew/Cellar/llvm/18.1.8/bin:"${HOME}/projects/kotlin-language-server/bin":"${HOME}/.local/bin":"$(go env GOPATH)/bin":"${PATH}"

alias ll="eza --long --header --icons --git --all"
alias lg="lazygit"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(/opt/homebrew/bin/brew shellenv)"
. "/Users/corythompson/.cargo/env"
eval "$(starship init zsh)"



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/corythompson/.opam/opam-init/init.zsh' ]] || source '/Users/corythompson/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# bun completions
[ -s "/Users/corythompson/.bun/_bun" ] && source "/Users/corythompson/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export VCPKG_ROOT="$HOME/vcpkg"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# Added by Configure-Netskope-Local-CA-Bundle-MacOS.sh
[ -f "$HOME/.netskope/netskope-ca.env" ] && . "$HOME/.netskope/netskope-ca.env"

