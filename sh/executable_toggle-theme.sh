#!/bin/sh

# 1. 定义状态文件路径
STATE_FILE="$HOME/.cache/system-theme-mode"
KITTY_PATH="$HOME/.config/kitty"
KITTY_THEME="${KITTY_PATH}/current-theme.conf"

if [ ! -f "$STATE_FILE" ]; then
    echo "dark" > "$STATE_FILE"
fi

# 2. 获取当前模式 (默认黑夜)
CURRENT_MODE=$(cat "$STATE_FILE" 2>/dev/null)

if [ "$CURRENT_MODE" = "dark" ]; then
    # --- 切换到白天模式 ---
    
    # set system theme light
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Light' # 或你喜欢的亮色主题
    sed -i 's/theme=.*/theme=WhiteSurLight/' "$HOME/.config/Kvantum/kvantum.kvconfig"
    
    # program theme config   
    ln -sf "${KITTY_PATH}/day.conf" "$KITTY_THEME"
    pkill -USR1 kitty
    

    echo "light" > "$STATE_FILE"
    notify-send "系统主题" "Light"
else
    # --- 切换到黑夜模式 ---
    
    # set system theme light
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-Dark'
    sed -i 's/theme=.*/theme=WhiteSurDark/' "$HOME/.config/Kvantum/kvantum.kvconfig"
    
    ln -sf "${KITTY_PATH}/night.conf" "$KITTY_THEME"
    pkill -USR1 kitty
    
    # C. 记录状态
    echo "dark" > "$STATE_FILE"
    notify-send "系统主题" "Dark"
fi
