#!/bin/bash

############################################################
#
# Require "jq" command.
# $ sudo apt-get install jq
# or
# $ yum -y install wget
# $ yum -y install epel-release
# $ yum -y install --enablerepo=epel jq
#
# see https://qiita.com/asukiaaa/items/a9413b2cc60c598c3d61
#
# If you get all cascade data when JSON file is "temp.json",
# you can use this command.
# $ cat temp.json | jq "."
#
############################################################

year=`date "+%Y"`
month=`date "+%m"`
day=`date "+%d"`
hour=`date "+%H"`
min=`date "+%M"`

dateTime=$year$month$day$hour$min

array=(ksato K188001 K188002 K188003 K188004 K188005 K188006 K188007 K188008 K188009 K188010 K188011 K188012 K188013 K188014 K188015 K188016 K188017 K188018 K185001 K185003 K185004 K185005 K185006 K185008 K185009 K185010 K185011 K185012 K185015 K185016 K185017 K185018 K185019 K185020 K185021 K185022 K185023 K185025 K185027 K185028 K185029 K185030 K185031)
for ((i = 0; i < ${#array[@]}; i++)) {
        wget -q https://judgeapi.u-aizu.ac.jp/users/${array[i]} -O /dev/stdout > temp.json

        # id
        id=`cat temp.json | jq ".id" | sed s/\"//g`

        # name
        name=`cat temp.json | jq ".name" | sed s/\"//g`

        # affiliation
        affiliation=`cat temp.json | jq ".affiliation" | sed s/\"//g`

        # registerDate
        registerDate=`cat temp.json | jq ".registerDate" | sed s/\"//g`

        # lastSubmitDate
        lastSubmitDate=`cat temp.json | jq ".lastSubmitDate" | sed s/\"//g`

        # policy
        policy=`cat temp.json | jq ".policy" | sed s/\"//g`

        # country
        country=`cat temp.json | jq ".country" | sed s/\"//g`

        # birthYear
        birthYear=`cat temp.json | jq ".birthYear" | sed s/\"//g`

        # displayLanguage
        displayLanguage=`cat temp.json | jq ".displayLanguage" | sed s/\"//g`

        # defaultProgrammingLanguage
        defaultProgrammingLanguage=`cat temp.json | jq ".defaultProgrammingLanguage" | sed s/\"//g`

        # avatar
        avatar=`cat temp.json | jq ".avatar" | sed s/\"//g`

        # status - submissions
        submissions=`cat temp.json | jq ".status.submissions" | sed s/\"//g`

        # status - solved
        solved=`cat temp.json | jq ".status.solved" | sed s/\"//g`

        # status - accepted
        accepted=`cat temp.json | jq ".status.accepted" | sed s/\"//g`

        # status - wrongAnswer
        wrongAnswer=`cat temp.json | jq ".status.wrongAnswer" | sed s/\"//g`

        # status - timeLimit
        timeLimit=`cat temp.json | jq ".status.timeLimit" | sed s/\"//g`

        # status - memoryLimit
        memoryLimit=`cat temp.json | jq ".status.memoryLimit" | sed s/\"//g`

        # status - outputLimit
        outputLimit=`cat temp.json | jq ".status.outputLimit" | sed s/\"//g`

        # status - compileError
        compileError=`cat temp.json | jq ".status.compileError" | sed s/\"//g`

        # status - runtimeError
        runtimeError=`cat temp.json | jq ".status.runtimeError" | sed s/\"//g`

        # url
        url=`cat temp.json | jq ".url" | sed s/\"//g`

        # echo "insert into [table name] ([field 1],[field 2],[field 3],[field 4],[field 5],[field 6],[field 7],[field 8],) values ("$obs_date","$obs_time","$obs_weather","$obs_temperature","$obs_humidity","$obs_pressure","$obs_wind_direction","$obs_wind_speed");" >> temp.sql
        echo "INSERT INTO status VALUES (NULL,'"$dateTime"','"$id"','"$name"','"$affiliation"','"$registerDate"','"$lastSubmitDate"','"$policy"','"$country"','"$birthYear"','"$displayLanguage"','"$defaultProgrammingLanguage"','"$avatar"','"$submissions"','"$solved"','"$accepted"','"$wrongAnswer"','"$timeLimit"','"$memoryLimit"','"$outputLimit"','"$compileError"','"$runtimeError"','"$url"');" >> temp.sql

        rm temp.json
}

############################################################
# DBへの登録
############################################################
# /usr/bin/mysql -u [user name] -p[password] -s [database name] < temp.sql
/usr/bin/mysql -u root -prootpass -s aoj < temp.sql

rm temp.sql


exit 0
