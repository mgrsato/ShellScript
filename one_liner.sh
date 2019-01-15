#!/bin/sh

echo "＊＊＊#1-1 今日の天気＊＊＊"

echo -n "観測時刻："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d "," -f 1

echo -n "天気　　："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d " " -f 2

echo -n "気温："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<span class=\"obs_temp_main\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/"

echo -n "湿度："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 1

echo -n "気圧："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 2 | tail -n 1

echo -n "風向："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 3 | tail -n 1

echo -n "風速："
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 4 | head -n 3 | tail -n 1


echo "＊＊＊#1-2 今日の価格＊＊＊"

echo -n "amazon.co.jp："
wget -q 'https://www.amazon.co.jp/dp/B07FDQ3JF8' -O /dev/stdout -U Mozilla | grep -o "<span id=\"priceblock_ourprice\" class=\"a-size-medium a-color-price\"[^>]*>[^<]*</span>" | cut -d " " -f 5 | cut -d "<" -f 1

echo -n "amazon.com："
wget -q 'https://www.amazon.com/dp/B07FMSF312?th=1' -O /dev/stdout --user-agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36" | grep -A 2 "price_inside_buybox" | head -n 2 | tail -n 1 | cut -d "$" -f 2


echo "＊＊＊#1-3 自分で決めたURLから，取得したい値を取り出すワンライナー＊＊＊"

echo -n "Yahoo!ニュースの最新の記事5件のタイトル"
wget -q 'https://news.yahoo.co.jp/hl?c=dom' -O /dev/stdout | grep "<p class=\"ttl\">" | cut -d "<" -f 3 | cut -d ">" -f 2


echo "＊＊＊#1-4 複雑なワンライナー＊＊＊"

wget -q -O /dev/stdout --user-agent="Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36" "https://townwork.net/kanagawa/prc_0059/?ds=04" > temp;echo -n "仕事　：　";grep -A 36 "job-lst-main-contents" temp | sed -z 's/\t//g' | sed -z 's/\n//g' | cut -d "<" -f 14 | cut -d ">" -f 2;echo -n "時給　：　";grep -A 36 "job-lst-main-contents" temp | sed -z 's/\t//g' | sed -z 's/\n//g' | cut -d "<" -f 35 | cut -d ">" -f 2;echo -n "場所　：　";grep -A 36 "job-lst-main-contents" temp | sed -z 's/\t//g' | sed -z 's/\n//g' | cut -d "<" -f 48 | cut -d ">" -f 2;echo -n "時間　：　";grep -A 36 "job-lst-main-contents" temp | sed -z 's/\t//g' | sed -z 's/\n//g' | cut -d "<" -f 58 | cut -d ">" -f 2;echo -n "";rm temp;

exit 0
