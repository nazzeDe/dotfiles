-- Startup commands
hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c noctalia-shell --no-duplicate")
--    hl.exec_cmd("hyprctl setcursor Hei 48")
    hl.exec_cmd("clash-verge")
    hl.exec_cmd("systemctl --user restart xdg-desktop-portal.service xdg-desktop-portal-termfilechooser.service")
    hl.exec_cmd("systemctl --user restart fcitx5.service")
    hl.exec_cmd("hyprctl setcursor Hei 64")
end)
