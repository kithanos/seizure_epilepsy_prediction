# seizure_epilepsy_prediction
Projeto de Previsão de Epilepsia com aplicação de técnicas de Aprendizagem de Máquina.

Não deixe de acessar o artigo original deste Projeto em:

https://link.springer.com/chapter/10.1007/978-3-030-01421-6_12

Acesse também:

https://eventos.itp.ifsp.edu.br/index.php/VI_IC/VI_IC/paper/view/941

https://observatorio.fm.usp.br/handle/OPI/32931


---------------------------------------------INTRODUÇÃO--------------------------------------------

Neste repositório, estão uma sequência de scripts que automatiza a transformação dos
dados. Não há aplicação de nenhuma técnica de classificação, apenas as etapas de 
extração de caractéristicas dos vetores de dados.

Para aplicação das técnicas SOM (descrita no artigo), ou SVM, acesse estes outros dois repositórios:

SOM:
https://github.com/kithanos/som

SVM:
https://github.com/kithanos/svm_OpenCV_mod

Para outras técnicas vistas no artigo (exemplo: LDA) acesse:
https://github.com/kithanos/lda


Os dados utilizados são os do banco de dados público CHB-MIT EEG do Children’s Hospital
Boston, disponível em:

https://physionet.org/content/chbmit/1.0.0/

Para conversão dos dados no formato texto (.ascii), foi utilizado a ferramenta EDF Browser:

https://www.teuniz.net/edfbrowser/

A seguir, uma descrição dos scripts contidos neste projeto, atente-se para o fato de que a 
aplicação dessa sequencia de scripts em outros dados requer adequações no código e principalmente
nas chamadas de diretório.

---------------------------------------------INTRODUÇÃO--------------------------------------------

Os códigos foram desenvolvidos em shell-script, e em geral eles tratam arquivos (formatos), copiam, colam e 
criam diretórios e arquivos, e aplicam outros programas em diferentes linguagens.

O programa a ser executado é o ./epilepsia.sh, este programa apenas serve para chamar todos os outros scripts,
e perguntar ao usuário se os dados serão formatados para classificação com o SOM, ou com a SVM.

Os outros scripts, no geral executam estes processos:

Exclui a 1o Linha e Coluna: Script desenvolvido em shell script para excluir a primeira
linha (cabeçalho) e a primeira coluna (informação do tempo) do arquivo de texto do
EEG.

Corta Colunas: Script desenvolvido em shell script para cortar as colunas do arquivo
de texto de EEG, transformando cada coluna em um arquivo separado.

Segmenta em 4 segundos: Script desenvolvido em shell script que separa os
arquivos de cada canal em trechos (ou janelas) de 4 segundos, como a taxa de
amostragem é de 256 Hz, esta etapa separa as 307200 linhas em arquivos de (256
Hz * 4 = 1024 linhas) - considerando o arquivo de treinamento.

Aplica DWT: É aplicado um programa em linguagem C da biblioteca gsl que calcula
a DWT para cada coluna, a saída deste programa são arquivos com os coeficientes
wavelets calculados.

Separa Coeficientes de Detalhe: Script desenvolvido em shell script que separa a
primeira metade dos coeficientes wavelets calculados.

Aplica Zero Crossings: É aplicado um programa desenvolvido em linguagem C que
contabiliza a quantidade de vezes que cada arquivo da etapa anterior mudou de sinal,
a cada janela é associada uma contagem, nesta etapa, a quantidade de linhas dos
arquivos diminuem consideravelmente, uma vez que cada arquivo de janela com 1024
linhas será representado agora por um arquivo de uma linha com a contagem dos zero
crossings.

Junta Colunas: Script desenvolvido em shell script que junta em um arquivo único,
todas as contagens das colunas calculadas na etapa anterior.

Cria rótulos: É aplicado um programa desenvolvido em linguagem C++ que cria um
arquivo de rótulos correspondente a resposta desejada (no caso da SVM), ou um
arquivo que numera os vetores (para o SOM).

Cria diretório final: Script desenvolvido em shell script que une os arquivos de rótulos
e os vetores de dados em um único diretório, nomeando este diretório de acordo com
o nome do paciente e o trecho de EEG correspondente, nesta etapa o arquivo de
dados que contém os vetores de características a serem aplicados nas etapas
seguintes são convertidos no formato ASCII, e o arquivo de rótulos no formato de texto
TXT.

---------------------------------------------REQUISITOS--------------------------------------------

O usuário deve ter instalado em sua máquina os seguintes programas/pacotes para execução

EDFBrowser - Separação dos dados de EEG e conversão do formato EDF para ASCII.

GSL - Pacote para implementação da Transformada Discreta de Wavelet.

GCC - Compilador das linguagens C e C++.

Bash - Interpretador da linguagem shell script.


---------------------------------------------COMPILAÇÃO--------------------------------------------

Os programas localizados nos seguintes diretórios devem ser compilados antes da execução:

/geraRotuloSVM/geraRotuloSVM.cpp
geraSerieNumerosConsecutivosTexto/geraSerieNumerosConsecutivosTexto.cpp
/transformada_wavelet/transformadaWavelet.c
/zero_crossings/zero_crossingsv1.c

---------------------------------------------EXECUÇÃO--------------------------------------------

Foram fornecidos alguns dados de exemplos, localizado em /Dados Originais, antes (ou a cada) da execução, 
deve-se apagar qualquer arquivo na pasta /Dados, e colar os arquivos de dados nesta pasta.

O nome do arquivo de dados começa com o padrão "chb", e uma numeração, atente-se em numerar seus arquivos
de forma sequencial para os scripts poderem iterar sobre eles em um loop controlado. Além disso, caso
utilize outro nome para os arquivos, atente-se em alterar em cada script localizado /chb com essa nova terminação.

Atendido todos os requisitos acima, basta executar o script epilepsia.sh, caso os dados sejam gerados para a SVM,
é necessário saber a quantidade de dados de cada classe a ser classificada, e elas deve estar ordenadas de forma 
sequencial no arquivo de dados original.

No final, os vetores de dados processados estarão localizados dentro da pasta /Dados/chb*_* com o nome v_chb*_*. Apenas
os arquivos com os vetores já tratados estarão presentes, os dados originais não (estes ainda estarão disponíveis em 
/Dados Originais).



