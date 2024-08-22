```mql5
//+------------------------------------------------------------------+
//|                                                   SimpleBot.mq5  |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                       http://www.metaquotes.net/ |
//+------------------------------------------------------------------+
input int FastSMAPeriod = 5;         // Fast SMA Period
input int SlowSMAPeriod = 15;        // Slow SMA Period
input int RSIPeriod = 14;             // RSI Period
input double TakeProfit = 20;         // Take Profit (in pips)
input double StopLoss = 10;           // Stop Loss (in pips)

//--- indicator handles
int fastSMAHandle;
int slowSMAHandle;
int rsiHandle;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
    // Create SMA and RSI indicators
    fastSMAHandle = iMA(NULL, 0, FastSMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
    slowSMAHandle = iMA(NULL, 0, SlowSMAPeriod, 0, MODE_SMA, PRICE_CLOSE);
    rsiHandle = iRSI(NULL, 0, RSIPeriod, PRICE_CLOSE);
    
    return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
    double fastSMA = CopyBuffer(fastSMAHandle, 0, 0, 1);
    double slowSMA = CopyBuffer(slowSMAHandle, 0, 0, 1);
    double rsi = CopyBuffer(rsiHandle, 0, 0, 1);

    // Buy condition
    if (fastSMA > slowSMA && rsi < 70)
      {
        if (OrderSelect(0, SELECT_BY_POS) == false || OrderType() != OP_BUY)
          {
            OrderSend(Symbol(), OP_BUY, 0.1, Ask, 2, Ask-StopLoss*Point, Ask+TakeProfit*Point, "Buy Order", 0, 0, clrGreen);
          }
      }

    // Sell condition
    if (fastSMA < slowSMA && rsi > 30)
      {
        if (OrderSelect(0, SELECT_BY_POS) == false || OrderType() != OP_SELL)
          {
            OrderSend(Symbol(), OP_SELL, 0.1, Bid, 2, Bid+StopLoss*Point, Bid-TakeProfit*Point, "Sell Order", 0, 0, clrRed);
          }
      }
  }
//+------------------------------------------------------------------+
```
