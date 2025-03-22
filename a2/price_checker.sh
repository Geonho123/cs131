#!/bin/bash

# Check usage - If no URL is provided, display an error message
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 'Product URL' [Interval in seconds]"
    exit 1
fi

# Store the provided URL and optional interval
URL="$1"
INTERVAL=${2:-5}  # Default sleep time is 5 seconds, but user can change it

# Generate a unique price file name based on the URL (prevents conflicts)
PRICE_FILE="price_$(echo "$URL" | md5sum | cut -d ' ' -f1).txt"

# Function to check the price
check_price() {
    # Fetch the webpage content and extract the price using regex
    PRICE=$(curl -s "$URL" | grep -oP '\$\d+\.\d{2}' | head -n 1)

    # Check if the price was successfully extracted
    if [ -z "$PRICE" ]; then
        echo "Could not retrieve the price. Please check the URL."
        return
    fi

    echo "Checking price for $URL..."
    echo "Current price: $PRICE"

    # Check if a previous price exists
    if [ -f "$PRICE_FILE" ]; then
        LAST_PRICE=$(cat "$PRICE_FILE")

        if [ "$LAST_PRICE" != "$PRICE" ]; then
            echo "Price change detected!"
            echo "Previous price: $LAST_PRICE → Current price: $PRICE"
            echo "The script detected that the price changed from $LAST_PRICE to $PRICE."
        else
            echo "No price change."
        fi
    else
        echo "First run for $URL: No previous price data available."
        echo "This means the script is running for the first time, so it doesn’t have previous price data."
    fi

    # Save the current price for future comparison
    echo "$PRICE" > "$PRICE_FILE"
}

# Run the price check every user-defined seconds
while true; do
    check_price
    sleep "$INTERVAL"
done
