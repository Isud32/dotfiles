#sets monitor bangho to be at the left of my samsung monitor and it gives it res 1360x768
xrandr --output HDMI-0 --mode 1360x768 --right-of VGA1 &

xwallpaper --zoom Imgs/wallpapers/LegacyWall.jpg &

# Variables for the japanese IME

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export SDL_IM_MODULE=fcitx
export gtk-im-module=fexport 
export XMODIFIERS=@im=fcitxcitx
# japanese IME
fcitx5 &

# Compositor 
picom &
# Status bar (scripts at .local/src/blockscripts
dwmblocks &
# clipboard with rofi
greenclip daemon &
# turn off Display Power Management Service (DPMS) and black screensaver
xset s off -dpms

exec dwm
