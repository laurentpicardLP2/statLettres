#!/bin/bash

recensementParLettre() 
{
	case $2 in
		"bleu" | "Bleu" | "BLEU" | "bleue" | "Bleue" | "BLEUE" | "b" | "B")
			couleurVoyelle="\033[34m"
			;;
		"rouge" | "Rouge" | "ROUGE" | "r" | "R")
			couleurVoyelle="\033[31m"
			;;
		"vert" | "Vert" | "VERT" | "verte" | "Verte" | "VERTE" | "v" | "V")
			couleurVoyelle="\033[32m"
			;;
		"jaune" | "Jaune" | "JAUNE" | "j" | "J")
			couleurVoyelle="\033[33m"
			;; 
		*)
			couleurVoyelle="\033[39m"
			;;
	esac
	case $3 in
		"bleu" | "Bleu" | "BLEU" | "bleue" | "Bleue" | "BLEUE" | "b" | "B")
			couleurConsonne="\033[34m"
			;;
		"rouge" | "Rouge" | "ROUGE" | "r" | "R")
			couleurConsonne="\033[31m"
			;;
		"vert" | "Vert" | "VERT" | "verte" | "Verte" | "VERTE" | "v" | "V")
			couleurConsonne="\033[32m"
			;;
		"jaune" | "Jaune" | "JAUNE" | "j" | "J")
			couleurConsonne="\033[33m"
			;; 
		*)
			couleurConsonne="\033[39m"
			;;
	esac

	tabLettre=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z')
	for i in `seq 0 25`
	do
		tabOccur[$i]=`grep -c ${tabLettre[$i]} $1`
	done
	sortedTabOccur=( $( printf "%s\n" "${tabOccur[@]}" | sort -rn ) )
	for i in `seq 0 25`
	do
		for j in `seq 0 25`
		do
			if [ ${sortedTabOccur[$i]} -eq ${tabOccur[$j]} ]
			then
				if [ ${tabLettre[$j]} = 'A' ] || [ ${tabLettre[$j]} = 'E' ] || [ ${tabLettre[$j]} = 'I' ] || [ ${tabLettre[$j]} = 'O' ] || [ ${tabLettre[$j]} = 'U' ] || [ ${tabLettre[$j]} = 'Y' ]
				then
					echo -e  "$couleurVoyelle\033[1m${tabLettre[$j]} - ${sortedTabOccur[$i]}"
				else
					
					echo -e  "$couleurConsonne\033[1m${tabLettre[$j]} - ${sortedTabOccur[$i]}"
				fi
			fi
		done
	done
}


if [ $# -ge 1 ] && [ $1 = 'dico.txt' ]
then
	recensementParLettre $1 $2 $3
else 
	if [ $# -eq 0 ]
	then 
		echo "Nom de fichier absent"
	else
		echo "Nom de fichier incorrecte"
	fi
fi

