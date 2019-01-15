#!/bin/sh

#実行時日付
obs_date=`date "+%Y/%m/%d"`

#データ取得
wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O tmp.html

#観測時刻
obs_time=`cat tmp.html | grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d "," -f 1`

#天気
obs_weather=`cat tmp.html | grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d " " -f 2`

#現在の気温
obs_temperature=`cat tmp.html | grep -o "<span class=\"obs_temp_main\"[^>]*>[^<]*</span>" | sed -e "s/<span.*>\(.*\)<\/span>/\1/"`

#湿度
obs_humidity=`cat tmp.html | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 1`

#気圧
obs_pressure=`cat tmp.html | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 2 | tail -n 1`

#風向
obs_wind_direction=`cat tmp.html | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 3 | tail -n 1`

#風速
obs_wind_speed=`cat tmp.html | grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 4 | head -n 3 | tail -n 1`

############################################################
# DBへの登録
############################################################
# echo "insert into [table name] ([field 1],[field 2],[field 3],[field 4],[field 5],[field 6],[field 7],[field 8],) values ("$obs_date","$obs_time","$obs_weather","$obs_temperature","$obs_humidity","$obs_pressure","$obs_wind_direction","$obs_wind_speed");" > tmp.sql
# /usr/bin/mysql -u [user name] -p[password] -s [database name] < tmp.sql
# rm tmp.sql

############################################################
# 画面出力
############################################################
echo "観測日　："$obs_date
echo "観測時刻："$obs_time
echo "天気　　："$obs_weather
echo "気温　　："$obs_temperature
echo "湿度　　："$obs_humidity
echo "気圧　　："$obs_pressure
echo "風向　　："$obs_wind_direction
echo "風速　　："$obs_wind_speed

############################################################
# ファイル出力
############################################################
#echo "観測日,観測時刻,天気,気温,湿度,気圧,風向,風速"
#
#echo $obs_date"\t"$obs_time"\t"$obs_weather"\t"$obs_temperature"\t"$obs_humidity"\t"$obs_pressure"\t"$obs_wind_direction"\t"$obs_wind_speed >> weather.txt

rm tmp.html

exit 0
