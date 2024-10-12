#!/etin/bash

#Inputing the file we want

IFS=$'\t' 
rm -f *.details #Cleaning the output file
echo -e "Proccecing the file..." #Giving feedback
unset count

read -p "Would you like to get to get the output of all countries: " all_search

if [[ ${all_search} == "YES" ]]
 then

 while read name email city birthday_day birthday_month birthday_year country #We give which field a varibale
 do
	 if test -z || test ${country} == "country"
	 then
         echo -e "${count}\t${name}\t$city\t${country}" >> ${country// /}.details
	 fi
 done < example_people_data.tsv
        else echo - e "rrr"
		 fi
echo -e "DONE"



###################################################################################################################################
#Country specific search
####################################################################################################################################

read -p "Do you want to search for a specific country (YES/NO): " run_search  #Asking for an inpu to run this specific part of the code that asks for a specififc country

if [[ ${run_search} == "YES" ]]
 then 

 read -p "Please enter the country you want to search for: " wantedcountry #Gives the variable an input best on the user

 while read name email city birthday_day birthday_month birthday_year country #We give which field a varibale
 do

 #We need to count the lines with which specific country in heading 7 and then produce an ououtput file with heading number 1 that has those names
 if [[ ${country} == ${wantedcountry} ]]
  then
  count=$((count +1)) 
  echo -e "${name}\t${country}"
  echo -e "${name}\t${country}" >> Specified_Country_Output.details
 fi

 done < example_people_data.tsv
 
 echo -e "The amount of people from ${wantedcountry}: ${count}"

else
 echo -e "Skipping search"
fi
