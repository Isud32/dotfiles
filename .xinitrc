#sets monitor bangho to be at the left of my samsung monitor and it gives it res 1360x768

xrandr --output HDMI-0 --mode 1360x768 #--right-of VGA1 &


#xwallpaper --zoom Imgs/wallpapers/LegacyWall.jpg &
#xwallpaper --zoom Imgs/wallpapers/vangoghpainting.png &
xwallpaper --zoom Imgs/wallpapers/lily2.png &
# cursor
xrdb -merge ~/.Xresources
# export XCURSOR_THEME=miku-cursor-linux
# export XCURSOR_THEME=Chicago95_Cursor_White
export XCURSOR_THEME=pixelfun2-dracula
# export XCURSOR_THEME=pixelfun2-monochrome
# export XCURSOR_THEME=Frieren
# export XCURSOR_THEME=Frieren-Winter
# export XCURSOR_THEME=pixelfun2

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
# turn off Display Power Management Service (DPMS) and black screensaver
xset s off -dpms

export PATH="/home/tobias/.local/src/blockscript:$PATH"
# Status bar (scripts at .local/src/blockscripts
dwmblocks &
exec dwm
