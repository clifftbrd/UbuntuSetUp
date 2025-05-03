#!/bin/bash
printf "\033c"
#echo "Dates attempted";echo
#awk '/E.T 20../ {print}' update.log
echo; echo; echo "Dates with changes"
awk -e '/E.T/ {print "d",$0}' -e '/The following packages will be upgraded/,/not upgraded/ {print $0}' /home/cliff/updater/update.log>/home/cliff/updater/mktemp
awk -v prior="d" -v hold="" '
 {
  if (prior=="d")
   { if ($1=="d")
     {hold=$2" "$4" "$3" "$6" "$7" "$5}
      else
     {printf "\n";print "\033[33m" hold "\033[0m";prior=$1;getline;hold=$0}
   }
   else
    { if ($1=="d")
      {print hold; prior=$1;hold=$2" "$4" "$3" "$6" "$7" "$5}
      else
      {print hold;prior=$1;hold=$0}
    }
  }
END {if ($1 != "d") {print $0}}' /home/cliff/updater/mktemp

awk '/E.T/ {a=$0} END {printf "\n \n LAST WRITE \n" a "\n"}' /home/cliff/updater/update.log
