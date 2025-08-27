windowtitlev2() {
  IFS=',' read -r -a args <<< "$1"
  args[0]="${args[0]#*>>}"

  if [[ ${args[1]} == "Erweiterung: (Bitwarden Passwortmanager) - Bitwarden – Mozilla Firefox" ]]; then
    hyprctl --batch "\
      dispatch setfloating address:0x${args[0]}; \
      dispatch resizewindowpixel exact 20% 55%, address:0x${args[0]}; \
      dispatch movewindowpixel exact 40% 25%, address:0x${args[0]}; \
      dispatch focuswindow, address:0x${args[0]}; \
    "
  fi
}

handle() {
  case $1 in
    windowtitlev2\>*) windowtitlev2 "$1" ;;
  esac
}

socat -U - UNIX-CONNECT:"/$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" \
  | while read -r line; do handle "$line"; done
