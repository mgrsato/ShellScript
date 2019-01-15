#!/bin/sh

#「dateコマンド」を使って日時を取得し，変数に代入
year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`

# 画面出力
echo $year$month$day$hour$min$sec

echo $year"/"$month"/"$day" "$hour":"$min":"$sec

echo -n $year"年"
echo -n $month"月"
echo -n $day"日"
echo -n $hour"時"
echo -n $min"分"
echo $sec"秒"

exit 0
