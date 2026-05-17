-- Keybindings for Hyprland 0.55
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod  = "SUPER"
local terminal = "kitty"
local fileManager = "yazi"
local browser  = "zen-browser"
local noctalia = "qs -c noctalia-shell ipc call"
local home     = os.getenv("HOME")

-- Allow workspace cycles
hl.config({
    binds = {
        allow_workspace_cycles = true,
    },
})

---------------
-- Screenshots
---------------

hl.bind("Print", hl.dsp.exec_cmd(
    "hyprshot -m region -z -o ~/Pictures/screenshot && notify-send \"Screenshot saved\""
))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(
    "hyprshot -m output -z -o ~/Pictures/screenshot && notify-send \"Screenshot saved\""
))

---------------
-- Translation
---------------

hl.bind(mainMod .. " + ALT + D", hl.dsp.exec_cmd(home .. "/sh/dict.py"))

----------------
-- Brightness --
----------------

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctalia .. " brightness decrease"),
    { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctalia .. " brightness increase"),
    { repeating = true })

--------------
-- Volume ----
--------------

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctalia .. " volume muteOutput"),
    { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctalia .. " volume decrease"),
    { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctalia .. " volume increase"),
    { repeating = true })

---------------
-- Media ------
---------------

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctalia .. " media playPause"),
    { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctalia .. " media previous"),
    { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctalia .. " media next"),
    { locked = true })

-----------------
-- Desktop Env --
-----------------

hl.bind(mainMod .. " + XF86Launch6", hl.dsp.exec_cmd(noctalia .. " sessionMenu toggle"))
hl.bind("XF86Launch6", hl.dsp.exec_cmd(noctalia .. " lockScreen lock"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(noctalia .. " launcher toggle"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(noctalia .. " wallpaper random"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd(noctalia .. " wallpaper toggle"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(noctalia .. " notifications toggleHistory"))

---------------------
-- Basic Operations -
---------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

------------
-- Focus ---
------------

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

------------------
-- Move Windows --
------------------

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-------------------
-- Resize Windows -
-------------------

hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), {repeating = true})
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), {repeating = true})
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), {repeating = true})
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), {repeating = true})

-----------------------
-- Workspace Manager --
-----------------------

for i = 1, 10 do
	-- base workspace 1~10
    local key = i % 10 -- key 0 map workspace 10
    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))
	-- extand workspace 11 ~ 20
    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.focus({ workspace = i+10 }))
	
    hl.bind(mainMod .. " + CTRL + " .. key,
        hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + CTRL + " .. key,
        hl.dsp.window.move({ workspace = i+10 }))
end

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

---------------------------
-- Mouse Binds & Scrolling -
---------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

--------------
-- Gestures --
--------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "down",       action = "fullscreen" })
