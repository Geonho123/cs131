# Price Stalker

## Price Checker Script  

## What this command does  
This shell script fetches the current price of a product from a given URL and detects price changes over time.  

## Why/When this command is useful  
- Helps track price fluctuations on e-commerce sites.  
- Useful for getting notified when a product's price drops.  
- Automates price monitoring without manual checking.  

Specific scenario: Imagine that an item you want to buy has been listed in an auction. You want to track its price until it drops to your desired amount. However, you have assignments to complete and cannot spend the whole day constantly checking the auction website for price updates. In such a case, you can simply run this program, set the time interval, and monitor price fluctuations without manually checking the website.  

## How you can use this command  

### 1. Navigate to the script directory:  
cd ~/cs131/a2  

### 2. Run the script with a product URL:  
The script allows checking the price of a product from a given URL.  
It also allows setting a custom update interval (default: 5 seconds).  

#### Basic usage (Default 5s interval)  
./price_checker.sh "https://www.ebay.com.au/itm/115151488563"  

Output:  

Checking price for https://www.ebay.com.au/itm/115151488563...  
Current price: $499.00  

#### Set a custom interval (e.g., every 10 seconds)  
./price_checker.sh "https://www.ebay.com.au/itm/115151488563" 10  

This will check the price every 10 seconds instead of the default 5 seconds.  

### 3. Where price data is stored:  
Each URL's price is stored in a unique file (price_<hash>.txt),  
ensuring multiple products can be tracked separately.  

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

The script automatically tracks price fluctuations and notifies when a change is detected.  

### Stopping the script  
The script runs indefinitely until manually stopped.  
To stop the script, press:  

CTRL + C  
