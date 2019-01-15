#!/bin/sh

#「dateコマンド」を使って日時を取得し，変数「obs_date」に代入
year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`

# ファイル出力
echo $day"-"$month"-"$year" "$hour":"$min":"$sec >> test4.txt

exit 0
