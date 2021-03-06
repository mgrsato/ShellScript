#!/bin/sh

wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout > temp

obs_time=`grep -A 1 '<div class="weather-now__cont">' temp | sed -e "s/ *//" | sed -n 2p | sed -e "s/<p.*>\(.*\)<\/p>/\1/"`
obs_weather=`grep '<span class="tit">Weather</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<\/li>/\1/"`
obs_temperature=`grep '<span class="tit">Temp.</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<img.*><\/li>/\1/" | sed -e "s/.$//"`
obs_humidity=`grep '<span class="tit">RH</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<\/li>/\1/" | sed -e "s/.$//"`
obs_pressure=`grep '<span class="tit">Pres.</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<\/li>/\1/" | sed -e "s/...$//"`
obs_wind_direction=`grep '<span class="tit">Wind　</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<\/li>/\1/" | cut -d " " -f 1`
obs_wind_speed=`grep '<span class="tit">Wind　</span>' temp | sed -e "s/ *//" | sed -e "s/<li.*>\(.*\)<\/li>/\1/" | cut -d " " -f 2 | sed -e "s/...$//"`

#画面に出力
#echo "＊＊＊現在の天気＊＊＊"
#echo "データ取得時刻："$obs_time
#echo "天気："$obs_weather
#echo "気温："$obs_temperature
#echo "湿度："$obs_humidity
#echo "気圧："$obs_pressure
#echo "風向："$obs_wind_direction
#echo "風速："$obs_wind_speed

#ファイルに出力
#データ取得時刻，天気，気温，湿度，気圧，風向，風速
#echo $obs_time", "$obs_weather", "$obs_temperature", "$obs_humidity", "$obs_pressure", "$obs_wind_direction", "$obs_wind_speed >> weather2.txt

rm temp
exit 0
