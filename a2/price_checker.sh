#!/bin/bash

# Check usage - If no URL is provided, display an error message
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 'Product URL'"
    exit 1
fi

# Store the provided URL in a variable
URL="$1"
PRICE_FILE="last_price.txt"

# Function to check price
check_price() {
    # Fetch the webpage content and extract the price using regex
    PRICE=$(curl -s "$URL" | grep -oP '\$\d+\.\d{2}' | head -n 1)

    # Check if the price was extracted successfully
    if [ -z "$PRICE" ]; then
        echo " Could not retrieve the price. Please check the URL."
        exit 1
    fi

    # Display the extracted price
    echo " Current price: $PRICE"

    # Check if a previous price exists
    if [ -f "$PRICE_FILE" ]; then
        LAST_PRICE=$(cat "$PRICE_FILE")
        
        # Compare current price with the last recorded price
        if [ "$LAST_PRICE" != "$PRICE" ]; then
            echo " Price change detected! Previous price: $LAST_PRICE → Current price: $PRICE"
        else
            echo " No price change."
        fi
    else
        echo " First run: No previous price data available."
    fi

    # Save the current price for future comparison
    echo "$PRICE" > "$PRICE_FILE"
}

# Run the price check every 5 seconds
while true; do
    echo " Checking price..."
    check_price
    sleep 5
done
