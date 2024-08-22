xml
<?xml version="1.0" encoding="UTF-8"?>
<TradingBot>
    <Market>
        <Type>Volatility 100 Index</Type>
    </Market>
    <TradeParameters>
        <TradeType>Both Up/Down</TradeType>
        <CandleInterval>1 Minute</CandleInterval>
        <InitialInvestment>0.3</InitialInvestment>
        <MaxDrawdown>10%</MaxDrawdown>
        <MaxConsecutiveLosses>3</MaxConsecutiveLosses>
        <TakeProfit>2%</TakeProfit>
        <StopLoss>1%</StopLoss>
    </TradeParameters>
    <Indicators>
        <Indicator>
            <Type>SimpleMovingAverage</Type>
            <Period>5</Period>
            <Name>Fast SMA</Name>
        </Indicator>
        <Indicator>
            <Type>SimpleMovingAverage</Type>
            <Period>15</Period>
            <Name>Slow SMA</Name>
        </Indicator>
        <Indicator>
            <Type>RelativeStrengthIndex</Type>
            <Period>14</Period>
            <Name>RSI</Name>
            <Overbought>70</Overbought>
            <Oversold>30</Oversold>
        </Indicator>
    </Indicators>
    <TradingRules>
        <BuyCondition>
            <Condition>SMA(5) > SMA(15)</Condition>
            <Condition>RSI < 70</Condition>
        </BuyCondition>
        <SellCondition>
            <Condition>SMA(5) < SMA(15)</Condition>
            <Condition>RSI > 30</Condition>
        </SellCondition>
    </TradingRules>
    <Alerts>
        <Notification>
            <Type>Success</Type>
            <Message>Trade executed successfully.</Message>
        </Notification>
        <Notification>
            <Type>Error</Type>
            <Message>Trade execution error. Restarting...</Message>
        </Notification>
    </Alerts>
</TradingBot>
