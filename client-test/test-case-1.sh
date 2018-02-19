#!/bin/bash


BASENAME=test-case-1
INTERVAL=30

function do_log() 
{
LOG=$1

T=$(date '+%Y/%m/%d %T')

#echo "==Limelight=="
echo -n $T >> $LOG
echo -n ",Limelight," >> $LOG
E=http://lm-apiproxy.ctrip.com/api/framework/images4/target/nocache
curl -o /dev/null -s -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total},%{speed_download},%{http_code} -X POST -F file=@nocache.txt $E  >> $LOG
echo >> $LOG

#echo "== CloudFront =="
echo -n $T >> $LOG
echo -n ",AWS-CF," >> $LOG
E=http://aw-apiproxy.ctrip.com/api/framework/images4/target/nocache
curl -o /dev/null -s -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total},%{speed_download},%{http_code} -X POST -F file=@nocache.txt $E  >> $LOG
echo >> $LOG

#echo "==Akamai=="
echo -n $T >> $LOG
echo -n ",Akamai," >> $LOG
E=http://apiproxy.ctrip.com/api/framework/images4/target/nocache
curl -o /dev/null -s -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total},%{speed_download},%{http_code} -X POST -F file=@nocache.txt $E  >> $LOG
echo >> $LOG

#echo "==Level3=="
echo -n $T >> $LOG
echo -n ",Ayaka(level3)," >> $LOG
E=http://l3-apiproxy.ctrip.com/api/framework/images4/target/nocache
curl -o /dev/null -s -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total},%{speed_download},%{http_code} -X POST -F file=@nocache.txt $E  >> $LOG
echo >> $LOG

#echo "==CloudFlare=="
echo -n $T >> $LOG
echo -n ",CloudFlare," >> $LOG
E=http://cf-apiproxy.ctrip.com/api/framework/images4/target/nocache
curl -o /dev/null -s -w %{time_namelookup},%{time_connect},%{time_starttransfer},%{time_total},%{speed_download},%{http_code} -X POST -F file=@nocache.txt $E  >> $LOG
echo >> $LOG

}


## Main ##
mkdir -p logs/$BASENAME/

#echo "Date,Provider,time_namelookup,time_connect,time_starttransfer,time_total,speed_download,http_code" > $LOG

while  [ 1 ]; do
	LOG_FILE="logs/$BASENAME/$BASENAME.$(date +%Y-%m-%d).csv"

	if [ ! -f ${LOG_FILE} ]; then
		echo "Date,Provider,time_namelookup,time_connect,time_starttransfer,time_total,speed_download,http_code" > ${LOG_FILE}
	fi

	do_log ${LOG_FILE}
##	exit 0


	sleep $INTERVAL
done

exit 0
