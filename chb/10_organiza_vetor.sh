

#!bin/bin/bash

cd Dados
pwd

for pasta in chb**
do
    echo entrando na pasta: $pasta
    cd $pasta
    nomevetor="v"_$pasta
    echo Criando pasta $nomevetor
    mkdir $nomevetor
    #rm $nomevetor
    endereco=$(pwd)
    echo endereco: $endereco

    for pasta_1 in chb*_*
    do
	echo entrando na pasta: $pasta_1
	cd $pasta_1
	
	nome_vetor="$endereco"/"$nomevetor/"

	cp v_chb*_* "$nome_vetor"
	echo Salvando na pasta: $nome_vetor

	cd ..

	echo Removendo pasta: $pasta_1
	rm -r $pasta_1
    done
    
    cd ..
done

cd ..
pwd
