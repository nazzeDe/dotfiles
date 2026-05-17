#!/bin/bash

SRC_DOCS="/home/nazze/Documents"
SRC_MUSIC="/home/nazze/Music"
SRC_PICTURE="/home/nazze/Pictures"
DEST_DOCS="/run/media/nazze/Ventoy/Documents"
DEST_MUSIC="/run/media/nazze/Ventoy/Music"
DEST_PICTURE="/run/media/nazze/Pictures"

# 检查目标挂载点是否存在
if mountpoint -q "/run/media/nazze/Ventoy"; then
    rsync -a --delete "$SRC_DOCS/" "$DEST_DOCS/"
    rsync -a --delete "$SRC_MUSIC/" "$DEST_MUSIC/"
    rsync -a --delete "$SRC_PICTURE/" "$DEST_PICTURE/"
    sync
    notify-send "Ventoy文件同步完成"
fi
