def stock_picker(prices)
    buy_day = 0
    sell_day = 0
    max_profit = 0
    
    prices.each_with_index do |buy_price, buy_index|
      prices[buy_index+1..-1].each_with_index do |sell_price, sell_index|
        if sell_price - buy_price > max_profit
          max_profit = sell_price - buy_price
          buy_day = buy_index
          sell_day = buy_index + sell_index + 1
        end
      end
    end
  
    [buy_day, sell_day]
  end
  prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
  result = stock_picker(prices)
  puts result.inspect