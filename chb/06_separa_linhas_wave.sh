#Programa que acessa os arquivos depois de aplicada a TWD e separa as última metade de linhas do arquivo (coeficientes de detalhe), salva na mesma pasta e exclui os arquivos wavelets com ambos os coeficientes

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

	for pasta_1 in c_chb*_*
	do
	    echo entrando na pasta: $pasta_1
	    cd $pasta_1
	    echo entrando na pasta: janelas
	    cd janelas
	    echo entrando na pasta: wavelets
	    cd wavelets

	    for arq in wave_c_chb*_*
	    do
		echo encontrou arquivo $arq
		#ATENTAR PARA O TAMANHO DA JANELA
		tail -n 512 $arq > d"$arq" #1º nível detalhe TWD
		#head -n 512 $arq | tail -n 256 > d"$arq" #2º nível detalhe TWD
		#head -n 256 $arq | tail -n 128 > d"$arq" #3º nível detalhe TWD
		#head -n 128 $arq | tail -n 64 > d"$arq" #4º nível detalhe TWD
		#head -n 64 $arq | tail -n 32 > d"$arq" #5º nível detalhe TWD
		#head -n 32 $arq | tail -n 16 > d"$arq" #6º nível detalhe TWD
		#head -n 16 $arq | tail -n 8 > d"$arq" #7º nível detalhe TWD
		#head -n 8 $arq | tail -n 4 > d"$arq" #8º nível detalhe TWD
		#head -n 4 $arq | tail -n 2 > d"$arq" #9º nível detalhe TWD
		#head -n 2 $arq | tail -n 1 > d"$arq" #10º nível detalhe TWD
		
		#tail -n 768 $arq > d"$arq" #1º e 2º nível detalhe TWD
		rm $arq
	    done
	    cd ..
	    cd ..
	    cd ..
	done

    cd ..
    done

    cd ..
done

cd ..
