#!/bin/bash

readonly Recipient='admin@gmail.com'
readonly Subject='greeting'
readonly Message='hello admin'

readonly Year=`eval date +%Y`
readonly Month=`eval date +%m`
readonly Day=`eval date +%d`
readonly Hour=`eval date +%H`
readonly Minute=`eval date +%M`

: 'current Date is: $Day-$Month-$Year and Time $Hour-$Minute'
`mail -s [$Year:$Month:$Day] $Subject $Recipient <<< $Message`
echo 'wait command' & && wait $! && exit $? : 'exit with status $?' 
