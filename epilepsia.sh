#!/bin/bash

#Define se o formato dos dados sera para o SOM(nao supervisionado)
#ou SVM (supervisionado)
echo "Dados para som ou svm? "
read classi

echo Etapa 01: Cortando Colunas
./chb/01_cortacolunas_v1.sh

echo Etapa 02: Separando em Diretórios
./chb/02_cria_diretorios.sh

echo Etapa 03: Separando em janelas
./chb/03_separa_linhasv3.sh

echo Etapa 04: Invertendo a ordem das janelas
./chb/04_Renomeia_arquivos_v1.sh

echo Etapa 05: Calculando TWD
./chb/05_chama_wavelet.sh

echo Etapa 06: Separando Coeficientes da TWD
./chb/06_separa_linhas_wave.sh

echo Etapa 07: Calculando Zero Crossings
./chb/07_zero_crossingsv2.sh

echo Etapa 08: Criando vetores
./chb/08_junta_colunas.sh

echo Etapa 09: Converte para ascii
./chb/09_converte_formato.sh

echo Etapa 10: Organizando vetores
./chb/10_organiza_vetor.sh

echo Etapa 11: Organiza arquivo de saida
./chb/11_organiza_dados_saida_v2.sh

if [ $classi = "som" ];
then
    echo Etapa12: Gera rotulos SOM
    ./chb/12_gera_rotulos_v2.sh

else
    echo Etapa12: Gera rotulos SVM
    ./chb/13_gera_rotulos_SVM.sh
fi

echo Concluído!
