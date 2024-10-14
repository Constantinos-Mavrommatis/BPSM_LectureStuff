#!/usr/bin/bash


input="$PWD/*.fq.gz"
File_name=$(cat Tco2.fqfiles | awk 'BEGIN{FS="\t";}{print $1, $6, $7;}' | grep "Tco" | head -2) #
Output="$PWD/Outputs"
rm -f /localdisk/home/s2748062/Exercises/Lecture07/My_First_Pipeline/Outputs/Tco* 

read -p "Would you like to acess the quality of your files (YES/NO): " script_run

if [[ ${script_run} == YES ]]
then
	while read File_Name Pair_1 Pair_2
	do
		echo -e "Proccessing: ${File_Name} with ${Pair_1}\t${Pair_2}"
		fastqc -o ${Output} -t 128 ${Pair_1} ${Pair_2}
	done <<< ${File_name}
	
	read -p "Would you like to get a summary of the files ? (YES/NO): " script_run_2
	
	if [[ ${script_run_2} == YES ]]
	then
		while read File_Name Pair_1 Pair_2
		do
			Pair_1_Sum=${Pair_1%.fq.gz}
			Pair_2_Sum=${Pair_2%.fq.gz}
			
			Summarize_1=$(unzip -p "${Output}/${Pair_1_Sum}_fastqc.zip" "*fastqc/fastqc_data.txt")
			Summarize_2=$(unzip -p "${Output}/${Pair_2_Sum}_fastqc.zip" "*fastqc/fastqc_data.txt")

			echo -e "Summarizing file: ${File_Name}"

			filename_Pair_1=$(echo "${Summarize_1}" | grep "Filename" | cut -f 2)
			total_sequences_Pair_1=$(echo "${Summarize_1}" | grep "Total Sequences" | cut -f 2)
			sequence_length_Pair_1=$(echo "${Summarize_1}" | grep "Sequence length" | cut -f 2)
			gc_content_Pair_1=$(echo "${Summarize_1}" | grep "%GC" | awk 'BEGIN{FS="\t";}{print $2}') 
			
			filename_Pair_2=$(echo "${Summarize_2}" | grep "Filename" | cut -f 2)
			total_sequences_Pair_2=$(echo "${Summarize_2}" | grep "Total Sequences" | cut -f 2)
			sequence_length_Pair_2=$(echo "${Summarize_2}" | grep "Sequence length" | cut -f 2)
			gc_content_Pair_2=$(echo "${Summarize_2}" | grep "%GC")
			
			echo -e "Total Sequences for ${filename_Pair_1}: ${total_sequences_Pair_1}"
			echo -e "Total Sequence Length for ${filename_Pair_1}: ${sequence_length_Pair_1}"
			echo -e "Total GC content for ${filename_Pair_1}: ${gc_content_Pair_1}"
			
			echo "Total Sequences for Pair 2: ${total_sequences_Pair_2}"


		
		done <<< ${File_name}
	else
		echo "Skipping"
	fi
else
	echo "Skipping"
fi










