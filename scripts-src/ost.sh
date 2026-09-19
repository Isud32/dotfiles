#!/usr/bin/bash

# Shuffle all video IDs once, store in array
echo "Fetching video list from @MoolongTea ..."
mapfile -t VIDEOS < <(
    yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/@MoolongTea/videos" | shuf
)

# Total count
TOTAL=${#VIDEOS[@]}
CURRENT=0

# Temporary keybind config (used for every mpv invocation)
INPUT_CONF=$(mktemp)
trap 'rm -f "$INPUT_CONF"' EXIT

# Create keybind file
cat > "$INPUT_CONF" <<EOF
s quit 0
q quit 1
b quit 2
p cycle pause
+ add volume 5
- add volume -5
EOF

# Function: play video at index $1
play_video() {
    local idx=$1
    local id="${VIDEOS[$idx]}"
    local url="https://www.youtube.com/watch?v=$id"

    # Fetch the video title using yt-dlp
    echo -e "\n\e[32m⏯ Now playing:\e[0m \e[1m$(yt-dlp --get-title "$url")\e[0m"
    echo -e "\e[36m($((idx+1)) of $TOTAL)\e[0m"

    # Run mpv with the single URL, using the custom keybind config
    mpv --no-video \
        --volume=35 \
        --input-conf="$INPUT_CONF" \
        "$url"
    local exit_code=$?

    # Interpret exit code
    if [[ $exit_code -eq 1 ]]; then
        echo "Quitting script."
        exit 0
    elif [[ $exit_code -eq 2 ]]; then
        # go back if possible
        if [[ $idx -gt 0 ]]; then
            CURRENT=$((idx - 1))
        else
            echo "Already at first video, can't go back."
            CURRENT=$idx   # stay, but still repeat same video? Better to repeat or do nothing.
            # We'll just not change CURRENT, but we need to recall play_video? We'll set a flag.
        fi
    else
        # normal next
        if [[ $idx -lt $((TOTAL-1)) ]]; then
            CURRENT=$((idx + 1))
        else
            echo "End of playlist. Looping from start."
            CURRENT=0
        fi
    fi
}

# Main loop
while true; do
    play_video $CURRENT
done
