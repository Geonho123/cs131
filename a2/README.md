# Price Checker Script

## What this command does
This shell script fetches the current price of a product from a given URL and detects price changes over time.

## Why/When this command is useful
- Helps track price fluctuations on e-commerce sites.
- Useful for getting notified when a product's price drops.
- Automates price monitoring without manual checking.

## How you can use this command
1. Navigate to the script directory:  
   cd ~/cs131/a2

2. Run the script with a product URL:  
   ./price_checker.sh "https://www.ebay.com.au/itm/115151488563"  
   Current price: $499.00  

   ./price_checker.sh "https://www.ebay.com.au/itm/265899139884"  
   Current price: $349.95  

   These two are different products. (Showing the example of the price change)

3. The script will check the price every 5 seconds until manually stopped (CTRL + C).

## Examples

### First time running the script
Checking price...  
Current price: $499.00  
First run: No previous price data available.  

This means the script is running for the first time, so it doesn’t have previous price data.

### Price change detected
Checking price...  
Current price: $349.95  
Price change detected!  

Previous price: $499.00  
Current price: $349.95  

The script detected that the price dropped from $499.00 to $349.95.
