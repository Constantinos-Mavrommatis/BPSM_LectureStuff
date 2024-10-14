#!/usr/bin/bash


input="$PWD/*.fq.gz"
File_name=$(cat Tco2.fqfiles | awk 'BEGIN{FS="\t";}{print $1, $6, $7;}' | grep "Tco" | head -1) #
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
else
	echo "Skipping"
fi


read -p "Would you like to get a summary of the files ? (YES/NO): " script_run_2

if [[ ${script_run_2} == YES ]]
then
	while read File_Name Pair_1 Pair_2
	do
		Pair_1_Sum=${Pair_1%.fq.gz}
		Pair_2_Sum=${Pair_2%.fq.gz}
		Summarize=$(unzip -p "${Output}/${Pair_1_Sum}_fastqc.zip" "*fastqc/fastqc_data.txt")
		
		echo -e "Summarizing file: ${File_Name}"
		
		filename_Pair_1=$(echo "${Summarize}" | grep "Filename" | cut -f 2)
		total_sequences_Pair_1=$(echo "${Summarize}" | grep "Total Sequences" | cut -f 2)
		sequence_length_Pair_1=$(echo "${Summarize}" | grep "Sequence length" | cut -f 2)
		gc_content_Pair_1=$(echo "${Summarize}" | grep "%GC" | cut -f 2)

		filename_Pair_2=$(echo "${Summarize}" | grep "Filename" | cut -f 2)
                total_sequences_Pair_2=$(echo "${Summarize}" | grep "Total Sequences" | cut -f 2)
                sequence_length_Pair_2=$(echo "${Summarize}" | grep "Sequence length" | cut -f 2)
                gc_content_Pair_2=$(echo "${Summarize}" | grep "%GC" | cut -f 2)


		echo "Total Sequences for Pair 1: ${total_sequences_Pair_1}"
		echo "Total Sequences for Pair 2: ${total_sequences_Pair_2}"

	done <<< ${File_name}
else
	echo "Skipping"
fi










