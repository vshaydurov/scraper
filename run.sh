#!/usr/bin/env bash

# You need to put your own values here
CHAT_ID="000000000"
BOT_TOKEN="0000000000:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

# Get current datetime, used for logging
datetime_now=$(date +"%D %T")

# Create an empty file if it does not exist
touch prev_value.txt

# Get the old and the new values
new_value=$(./scrape.sh)
old_value=$(cat prev_value.txt)


# Compare the values
if [[ "$new_value" == "$old_value" ]]; then
    echo "[$datetime_now]: Same value - $new_value"
else
    message="[$datetime_now] Value has changed - $new_value!"
    echo "$message"

    # Send a message to Telegram
    curl -s --data "text=$message" --data "chat_id=$CHAT_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
fi

# Save the new value
echo "$new_value" > prev_value.txt
