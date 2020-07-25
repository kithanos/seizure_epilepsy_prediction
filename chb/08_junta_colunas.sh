

#!bin/bin/bash

cd Dados
pwd

for pasta in chb**
do
    echo entrando na pasta: $pasta
    cd $pasta

    for pasta1 in chb*_*
    do
	echo entrando na pasta: $pasta1
	cd $pasta1
	nomevetor="v"_$pasta1
	echo Criando arquivo $nomevetor
	touch $nomevetor
	#rm $nomevetor
	endereco=$(pwd)
	echo endereco: $endereco

	for pasta_1 in c_chb*_*
	do
	    echo entrando na pasta: $pasta_1
	    cd $pasta_1
	    echo entrando na pasta: janelas
	    cd janelas
	    echo entrando na pasta: wavelets
	    cd wavelets
	    
	    nome_vetor="$endereco"/"$nomevetor"

	    paste -d" " "$nome_vetor" zero_crossings.txt > tmp
	    mv tmp "$nome_vetor"
	    echo Salvando no arquivo: $nome_vetor

	    cd ..
	    cd ..
	    cd ..
	done
	cd ..

    done
    
    cd ..
done

cd ..

