

#!bin/bin/bash

#define o diretorio do programa que aplica a TWD
programa="/home/lucas/Documentos/Projetos/seizure_epilepsy_prediction/transformada_wavelet"

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

	for pasta_1 in c_chb*_*
	do
	    echo entrando na pasta: $pasta_1
	    cd $pasta_1
	    echo entrando na pasta: janelas
	    cd janelas
	    mkdir wavelets

	    for arq in c_chb*_*
	    do
		echo encontrou arquivo $arq
		"$programa"/transformadaWavelet -d $arq -n 1024 > wavelets/"wave_$arq" #Physionet
		rm $arq
	    done
	    cd ..
	    cd ..
	done
	cd ..
    done

cd ..
done

cd ..
pwd

