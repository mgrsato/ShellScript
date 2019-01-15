#!/bin/sh

year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`
sec=`date "+%S"`

# 画面出力
echo "もう"$month"月ですね"

if [ $month -ge 3 -a $month -le 5 ]; then
echo "日本の季節は春です"
elif [ $month -ge 6 -a $month -le 8 ]; then
echo "日本の季節は夏です"
elif [ $month -ge 9 -a $month -le 11 ]; then
echo "日本の季節は秋です"
else
echo "日本の季節は冬です"
fi

exit 0
