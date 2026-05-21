-- Look and feel settings
-- https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    general = {
        gaps_in    = 4,
        gaps_out   = 4,
        border_size = 3,
        layout     = "dwindle",

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
    },

    dwindle = {
        preserve_split = true,
    },

    decoration = {
        rounding       = 15,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled         = true,
            size            = 3,
            passes          = 2,
            vibrancy        = 0.1696,
            new_optimizations = true,
            ignore_opacity  = true,
            xray            = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Animation curves
hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("exit",     { type = "bezier", points = { {0.9, -0.2}, {0.95, 0.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 5,   bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,   bezier = "default",  style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,   bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,   bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,   bezier = "default" })

-- Input
hl.config({
    input = {
        kb_layout                  = "us",
        follow_mouse               = 1,
        float_switch_override_focus = 2,
    },
})

-- Misc
hl.config({
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        font_family              = "Maple Mono NF CN",
        mouse_move_enables_dpms  = true,
        key_press_enables_dpms   = true,
        enable_swallow           = true,
        focus_on_activate        = true,
    },
})

-- Cursor
hl.env("HYPRCURSOR_THEME", "Hei")
hl.env("HYPRCURSOR_SIZE", "64")

hl.env("XCURSOR_THEME", "Hei")
hl.env("XCURSOR_SIZE", "64")

hl.config({
})
