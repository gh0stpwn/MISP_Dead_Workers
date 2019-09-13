#!/bin/bash
# this search for the work dead in the workers and give us a count.
val=$(/var/www/MISP/app/Console/cake Admin getWorkers | grep alive | wc -l)
if [ $val -gt 0 ]
then
        echo "Number of dead workers: " > deadworkers.txt
        /var/www/MISP/app/Console/cake Admin getWorkers | grep dead | wc -l >> deadworkers.txt
        /var/www/MISP/app/Console/cake Admin getWorkers dead >> deadworkers.txt
        cat deadworkers.txt | sendmail email@mail.com
fi
