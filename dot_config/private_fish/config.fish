function fish_greeting
    # smth smth
end

starship init fish | source
zoxide init fish | source

if status --is-interactive
keychain --eval --quiet -Q orangestar suis | source
end

# 将所有 pycache 统一存放于用户缓存目录下
set -gx PYTHONPYCACHEPREFIX $HOME/.cache/pycache
# pytest
set -gx PYTEST_ADDOPTS "-o cache_dir=$HOME/.cache/pytest"


source /usr/share/doc/pkgfile/command-not-found.fish

abbr -a vim 'nvim'
abbr -a x 'ouch'
abbr -a how-many-code 'tokei'
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
alias ls 'eza --icons'
export EDITOR=nvim
export VISUAL=nvim

export OZONE_PLATFORM=wayland
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1


function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function set-proxy
  set -gx https_proxy http://127.0.0.1:7897
  set -gx http_proxy http://127.0.0.1:7897
  set -gx all_proxy socks5://127.0.0.1:7897
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
