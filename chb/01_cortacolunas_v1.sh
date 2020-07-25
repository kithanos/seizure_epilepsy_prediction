#!/bin/bash

cd Dados
pwd
#echo Etapa 01: Separando os canais

for pasta in chb**
do
    echo entrando na pasta: $pasta
    cd $pasta

    for pasta1 in chb*_*
    do
	echo entrando na pasta: $pasta1
	cd $pasta1	

	for arq in chb*_*.txt
	do
	    echo encontrou arquivo $arq
            for colu in `seq 2 24`;  #dados PhysioNet
	    do
		canal=$(($colu-1))   #dados PhysioNet
	    
		if [ "$canal" -lt "10" ]; 
		then
		    nomeArq=$(echo "$arq"_"cn0$canal".ascii)
		else
		    nomeArq=$(echo "$arq"_"cn$canal".ascii)
		fi
		nomeArq=$(echo $nomeArq | sed 's/\.txt//')
       		echo nome arquivo: $nomeArq
		#echo uma coluna:
		grep -v Time $arq | cut -d"," -f$colu > $nomeArq
	    done
	done
	cd ..
      done

    cd ..
done
cd ..
pwd

