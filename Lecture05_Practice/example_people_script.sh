#!/bin/bash

#Inputing the file we want

IFS="\t"

while read name email city birthday_day birthday_month birthday_year country
do

#We need to give a feedback of proccecing the file

wantedcountry="Mozambique"



#We need to count the lines with which specific country in heading 7 and then produce an ououtput file with heading number 1 that has those names
if [[ ${country} == ${wantedcounty} ]]
 then
 echo -e "${name}\t${email}\t${city}\t${birthday_day}\t${birthday_month}\t${birthday_year}\t${country}"

fi
done < example_people_data.tsv
     


#we need an output file 

#we need an output on the screen tha everything is finished and a file has been created

 
















