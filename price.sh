#!/usr/bin/bash

#価格取得
#price=`wget -q 'https://www.amazon.co.jp/dp/B07FDQ3JF8' -O /dev/stdout -U 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price priceBlockBuyingPriceString\"[^>]*>[^<]*</span>" | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price priceBlockBuyingPriceString\"[^>]*>[^<]*</span>" | cut -d " " -f 6 | cut -d "<" -f 1 > temp_price`
wget -q 'https://www.amazon.co.jp/dp/B07FDQ3JF8' -O /dev/stdout -U 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price priceBlockBuyingPriceString\"[^>]*>[^<]*</span>" | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price priceBlockBuyingPriceString\"[^>]*>[^<]*</span>" | cut -d " " -f 6 | cut -d "<" -f 1 > temp_price
#cat temp_price
price=`cat temp_price`

#「dateコマンド」を使って日時を取得し，変数に代入
year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`


#画面に出力
#echo "日時："$year"/"$month"/"$day" "$hour":"$min":"$sec
#echo "価格："$price

#ファイルに出力
echo $year"/"$month"/"$day" "$hour":"$min":"$sec", "$price >> price.txt


rm temp_price
exit 0
