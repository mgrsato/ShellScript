#!/bin/sh

price=`wget -q 'https://www.amazon.co.jp/dp/B07FDQ3JF8' -O /dev/stdout -U 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price priceBlockBuyingPriceString\"[^>]*>[^<]*</span>" | cut -d " " -f 5 | cut -d "<" -f 1 | cut -d ">" -f 2 | sed -e s/,//g | sed -e s/￥//g`

year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`
datetime=$year"/"$month"/"$day" "$hour":"$min":"$sec

echo "insert into price2 (datetime,price) values ('$datetime','$price');" > tmp.sql
/usr/bin/mysql -u dbuser -pdbuserpass -s acy_db < tmp.sql
rm tmp.sql

exit 0
