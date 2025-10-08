DESCRIPTION



&nbsp;	--TRADE--

1. **Trade\_id:** Unique identifier of each trade.
2. **Day:** Day of the week trade was taken. (Mon-Fri)
3. **trade\_open:** date and time of trade entry.
4. **trade\_close:** date and time of trade close.
5. **session:** trading session when trade was taken.
6. **asset:** financial instrument traded. (includes currency pairs and indexes
7. **position**: direction of market traded.
8. **bias**: speculated direction of price in the market before entry
9. **profile**: narrative of how price may achieve bias in the market.
10. **entry**: signature in price encouraging positioning a trade.
11. **confirmation**: another signature in price, further confirming entry.
12. **fvg\_level**: a gauge of how reassuring an FVG is.





&nbsp;	--RISK MANAGEMENT--

1. **Risk\_id:** unique identifier for the risk of each trade.
2. **stop\_loss\_pips:** number of pips set as stop loss.
3. **take\_profit\_pips:** number of pips set as take profit.
4. **risk\_to\_reward:** ratio of take\_profit\_pips to stop\_loss\_pips.
5. **risk\_usd:** amount risked in US Dollars.
6. **profit\_loss:** How much in US Dollars was won or lost.
7. **trail\_stop:** whether stop loss was moved while trade was active.
8. **outcome:** Whether the trade was a win or loss.
9. **balance:** Remaining capital in account.
   



&nbsp;	--PSYCHOLOGY--

1. Psychology\_id: unique identifier for the mental state behind each trade.
2. **setup\_alignment:** whether all factors of strategy aligned before trade entry.
3. **pre\_emotion:** emotion before taking the trade.
4. **post\_emotion:** emotion after taking the trade.
5. **retake\_trade:** consideration of whether trade will be retaken after trade day.
6. **mental\_state:** state of mind during trading session.





&nbsp;	--DAILY CANDLE DATA--

1. **DCD\_id:** unique identifier for data on the trades daily candle.
2. **daily\_candle:** type of candle formed by end of trading day.
3. **candle\_range\_pips:** how much pips in the daily candle.
4. **Pre-entry capture:** Image of the trade upon entry.
5. **Post-entry capture:** Image of the trade after exit.
