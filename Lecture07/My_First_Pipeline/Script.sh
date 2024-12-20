#!/usr/bin/bash


input="$PWD/*.fq.gz"
File_name=$(cat Tco2.fqfiles | awk 'BEGIN{FS="\t";}{print $1, $6, $7;}' | grep "Tco" | head -1) #
Output="$PWD/Outputs"
Fastqc_folder="$PWD/Outputs/Fastqc/"
Aligned_folder="$PWD/Outputs/Aligned/"

rm -fr ${Fastqc_folder}*_Fastqc

echo " "

read -p "Would you like to acess the quality of your files (YES/NO): " script_run

echo " "

if [[ ${script_run} == YES ]]
then
	while read File_Name Pair_1 Pair_2
	do
		echo -e "Proccessing: ${File_Name} with ${Pair_1}\t${Pair_2}"
		echo "-----------------------------------------------------------------------------------"
		mkdir ${Fastqc_folder}/${File_Name}_Fastqc
		fastqc -o ${Fastqc_folder}/${File_Name}_Fastqc -t 128 ${Pair_1} ${Pair_2}
	done <<< ${File_name}
	
	echo " "

	read -p "Would you like to get a summary of the files ? (YES/NO): " script_run_2
	
	echo " "

	if [[ ${script_run_2} == YES ]]
	then
		while read File_Name Pair_1 Pair_2
		do
			Pair_1_Sum=${Pair_1%.fq.gz}
			Pair_2_Sum=${Pair_2%.fq.gz}
			
			Summarize_1=$(unzip -p "${Fastqc_folder}/${File_Name}_Fastqc/${Pair_1_Sum}_fastqc.zip" "*fastqc/fastqc_data.txt")
			Summarize_2=$(unzip -p "${Fastqc_folder}/${File_Name}_Fastqc/${Pair_2_Sum}_fastqc.zip" "*fastqc/fastqc_data.txt")

			echo -e "Summarizing file: ${File_Name}"

			filename_Pair_1=$(echo "${Summarize_1}" | grep "Filename" | cut -f 2)
			total_sequences_Pair_1=$(echo "${Summarize_1}" | grep "Total Sequences" | cut -f 2)
			sequence_length_Pair_1=$(echo "${Summarize_1}" | grep "Sequence length" | cut -f 2)
			gc_content_Pair_1=$(echo "${Summarize_1}" | grep "%GC" | awk 'BEGIN{FS="\t";}{print $2}') 
			
			echo "--------------------------------------------------------------------------------------"

			filename_Pair_2=$(echo "${Summarize_2}" | grep "Filename" | cut -f 2)
			total_sequences_Pair_2=$(echo "${Summarize_2}" | grep "Total Sequences" | cut -f 2)
			sequence_length_Pair_2=$(echo "${Summarize_2}" | grep "Sequence length" | cut -f 2)
			gc_content_Pair_2=$(echo "${Summarize_2}" | grep "%GC" | awk 'BEGIN{FS="\t";}{print $2}')
			
			echo -e "Total Sequences for ${filename_Pair_1}: ${total_sequences_Pair_1}"
			echo -e "Total Sequence Length for ${filename_Pair_1}: ${sequence_length_Pair_1}"
			echo -e "Total GC content for ${filename_Pair_1}: ${gc_content_Pair_1}"
			
			echo "-------------------------------------------------------------------------"

			echo "Total Sequences for Pair 2: ${total_sequences_Pair_2}"
		       	echo -e "Total Sequence Length for ${filename_Pair_2}: ${sequence_length_Pair_2}"
                        echo -e "Total GC content for ${filename_Pair_2}: ${gc_content_Pair_2}"

			echo "-------------------------------------------------------------------------"
		
		done <<< ${File_name}
	else
		echo "Skipping"
	fi
else
	echo "Skipping"
fi

echo " "

read -p "Would you like to run an allingment (YES/NO): " allingment_run

echo " "

if [[ ${allingment_run} == YES ]]
then
	while read File_Name Pair_1 Pair_2
	do
		mkdir ${Aligned_folder}${File_Name}

		/localdisk/home/ubuntu-software/bowtie2-2.5.4//bowtie2 --local -x ./Genome_Sequence/Trypanosoma_congolense_IL3000 -1 ${Pair_1} -2 ${Pair_2} -p 128 -S ${Aligned_folder}${File_Name}/${File_Name}.sam 
		samtools view -bS ${Aligned_folder}${File_Name}/${File_Name}.sam > ${Aligned_folder}${File_Name}/${File_Name}.bam
		samtools sort ${Aligned_folder}${File_Name}/${File_Name}.bam -o ${Aligned_folder}${File_Name}/${File_Name}_sorted.bam
		samtools index ${Aligned_folder}${File_Name}/${File_Name}_sorted.bam
		samtools flagstat ${Aligned_folder}${File_Name}/${File_Name}_sorted.bam

	done <<< ${File_name}
else
	echo "Skipping"
fi












