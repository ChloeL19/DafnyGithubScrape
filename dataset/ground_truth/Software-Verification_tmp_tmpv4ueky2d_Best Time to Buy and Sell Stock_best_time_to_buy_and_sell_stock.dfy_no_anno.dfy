method best_time_to_buy_and_sell_stock(prices: array<int>) returns (max_profit: int)
{
    var min_price := 10001;
    max_profit := 0;
    
    var i := 0;
    while (i < prices.Length)
    {
        var price := prices[i];
        if (price < min_price)
        {
            min_price := price;
        }
        if (price - min_price > max_profit) {
            max_profit := price - min_price;
        }

        i := i + 1;
    }
}

