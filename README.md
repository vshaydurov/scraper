# scraper
Simple bash scraper that scrapes a given URL regularly and sends a notification to a Telegram chat when a scraped value changes.


## How to use
1. Update the `./crontab` configuration file.
2. Set the correct `CHAT_ID` and `BOT_TOKEN` in `./run.sh`.
3. Update the scraping command in `./scrape.sh`.
4. Run `./install.sh`.
