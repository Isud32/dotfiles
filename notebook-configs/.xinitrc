# NOTEBOOK XINIT FILE

xrandr --output HDMI-0 --mode 1920x1080 &


#xwallpaper --zoom Imgs/wallpapers/LegacyWall.jpg &
#xwallpaper --zoom Imgs/wallpapers/vangoghpainting.png &
xwallpaper --zoom imgs/wallpapers/tampopo.png &
# cursor
xrdb -merge ~/.Xresources
# export XCURSOR_THEME=miku-cursor-linux
# export XCURSOR_THEME=Chicago95_Cursor_White
#export XCURSOR_THEME=pixelfun2-dracula
# export XCURSOR_THEME=pixelfun2-monochrome
# export XCURSOR_THEME=Frieren
# export XCURSOR_THEME=Frieren-Winter
export XCURSOR_THEME=pixelfun2

# Variables for the japanese IME
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
# japanese IME
fcitx5 &

# Compositor 
picom &
# clipboard with rofi
greenclip daemon &
# notifications
dunst &
# turn off Display Power Management Service (DPMS) and black screensaver
xset s off -dpms

# running xob scripts for volume bar and brightness bar
/home/tobias/.local/src/xob-scripts/.venv/bin/python \
    /home/tobias/.local/src/xob-scripts/pulse-volume-watcher.py | xob &

/home/tobias/.local/src/xob-scripts/.venv/bin/python \
    /home/tobias/.local/src/xob-scripts/brightness-watcher.py | xob &

export PATH="/home/tobias/.local/src/blockscript:$PATH"
# Status bar (scripts at .local/src/blockscripts
dwmblocks &
exec dwm
