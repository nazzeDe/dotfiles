hl.monitor({
    output   = "desc:BOE",
    mode     = "highres@highrr",
    position = "0x1080",
    scale    = 1,
})

hl.monitor({
    output   = "desc:AU Optronics 0xA48F",
    mode     = "highres@highrr",
    position = "0x0",
    scale    = 1,
})

-----------------------------
---- WORKSPACE -> MONITOR ---
-----------------------------
for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "desc:AU"
    })
end

for i = 11, 20 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "desc:BOE"
    })
end
