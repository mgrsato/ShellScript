#!/bin/sh

wget -q https://weathernews.jp/onebox/35.455618/139.629826/temp=c -O /dev/stdout > temp

obs_time=`grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" temp | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d "," -f 1`
obs_weather=`grep -o "<span class=\"sub\"[^>]*>[^<]*</span>" temp | sed -e "s/<span.*>\(.*\)<\/span>/\1/" | cut -d " " -f 2`
obs_temperature=`grep -o "<span class=\"obs_temp_main\"[^>]*>[^<]*</span>" temp | sed -e "s/<span.*>\(.*\)<\/span>/\1/"`
obs_humidity=`grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" temp | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 1`
obs_pressure=`grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" temp | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 2 | tail -n 1`
obs_wind_direction=`grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" temp | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 3 | head -n 3 | tail -n 1`
obs_wind_speed=`grep -o "<td class=\"obs_sub_value\"[^>]*>[^<]*</td>" temp | sed -e "s/<td.*>\(.*\)<\/td>/\1/" | cut -d " " -f 4 | head -n 3 | tail -n 1`

echo "＊＊＊現在の天気＊＊＊"
echo "時刻："$obs_time
echo "天気："$obs_weather
echo "気温："$obs_temperature
echo "湿度："$obs_humidity
echo "気圧："$obs_pressure
echo "風向："$obs_wind_direction
echo "風速："$obs_wind_speed

rm temp
exit 0
