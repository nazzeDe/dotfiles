-- Window Rules
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    name  = "zen-browser",
    match = { class = "zen" },
    opacity = "1 override",
})

hl.window_rule({
    name  = "yazi-picker",
    match = { title = "^(termfilechooser)$" },
    float  = true,
    center = true,
    size   = "1000 700",
})

hl.window_rule({
    name  = "file-upload-zen",
    match = {
        class = "zen",
        title = "^(File Upload).*$",
    },
    float  = true,
    center = true,
    size   = "1400 900",
})

hl.window_rule({
    name  = "file-upload-baidu",
    match = {
        class = "Baidunetdisk",
        title = "选择下载目录",
    },
    float  = true,
    center = true,
    size   = "1400 900",
})

hl.window_rule({
    name  = "logisim-evolution",
    match = {
        class = "com-cburch-logisim-Main",
        title = ".*(Logisim-evolution).*$",
    },
    float   = false,
    opacity = "0.6 override",
    tile    = true,
})

hl.window_rule({
    name  = "obsidian",
    match = { class = "obsidian" },
    opacity = "0.9 override",
})

hl.window_rule({
    name  = "wechat",
    match = { class = "wechat" },
    float = false,
})
