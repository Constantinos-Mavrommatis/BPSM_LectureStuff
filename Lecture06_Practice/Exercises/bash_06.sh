#!/usr/bin/bash`

#Fields: query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score

inputfile="/localdisk/home/s2748062/Exercises/Lecture06_Practice/Exercises/blastoutput2.out"

echo -e "${inputfile}"
rm -f *.exercise.out

read -p  "Would you like a list of all the Subject Acessions of the HSPs (YES/NO): " run_S_acc

if [[ "${run_S_acc}" == YES ]]
then
	while read wholeline
	do
		if [[ "${wholeline:0:1}" != "#" ]]  # We need to get all the lines without the "#"
		then
			read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline} #Here we seperating the fields 
			echo -e "${S_acc}"
			echo -e "${S_acc}" >> Subject_accessions.exercise.out #We list the subject access
		fi
	
	done < ${inputfile}

echo -e "DONE"

else
	echo "Skipping"
fi
	
read -p  "Would you like a list of all the Aligment Length and Percent ID of the HSPs (YES/NO): " run_Align_length

if [[ "${run_Align_length}" == YES ]]
then
	while read wholeline
	do
		if [[ "${wholeline:0:1}" != "#" ]]
		then
		       	read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline} #Here we seperating the fields
			echo -e "${alignment_length}\t${pc_identity}"
			echo -e "${alignment_length}\t${pc_identity}" >> Align_length.exercise.out
		fi
	done < ${inputfile}

	echo "DONE"

else
	echo "Skipping"
fi

read -p  "Would you like a list of all the HSPs with a specific mismatch number (YES/NO): " run_miss_matches
if [[ "${run_miss_matches}" == YES ]]
then 
	read -p "What number of mismatches would you like: " number
	read -p "Would you like the number of mismatches that are Greater or Less to the number of mismatches you inputed: " different
	
	if [[ "${different}" == Greater ]] 
	then
		while read wholeline
		do
			if [[ "${wholeline:0:1}" != "#" ]]
			then
				read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline} #Here we seperating the fields
				if [[ "${mismatches}" -gt "${number}" ]]
				then
					echo -e "${mismatches}"
					echo -e "${wholeline}" >> mismatches.exercise.out
				fi
			fi
		done < ${inputfile}
		echo "DONE"
	else
	       	[[ "${different}" == Less ]]
		 while read wholeline
		 do
			 if [[ "${wholeline:0:1}" != "#" ]]
			 then
				 read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline} #Here we seperating the fields
				 if [[ "${mismatches}" -lt "${number}" ]]
				 then
					 echo -e "${mismatches}"
                                         echo -e "${wholeline}" >> mismatches.exercise.out
				 fi
			 fi
		 done < ${inputfile}
		 echo "DONE"
	fi
else
	echo "Skipping"
fi

read -p  "Would you like to see the list of HSPs with a specific length based on your previous results (YES/NO): " amino_length
if [[ "${amino_legth}" -eq "YES" ]]
then
	read -p "Number of amino acids you are looking for : " number
	while read wholeline
	do
		read Q_acc S_acc pc_identity alignment_length mismatches gap_opens Q_start Q_end S_start S_end evalue bitscore <<< ${wholeline}
		if [[ "${alignment_length}" -gt "${number}" ]]
		then
			echo -e "${alignment_length}\t${mismatches}"
			echo -e "${wholeline}" >> aligment_legth_mismatches.exercise.out
		fi
	done < "./mismatches.exercise.out"
	echo "DONE"
else
	echo "Skipping"
fi





