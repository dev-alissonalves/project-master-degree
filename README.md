# project-master-degree

Este repositório contém códigos em Matlab para gerar a média da taxa de disparo de neurônios artificiais e raster plots dos mesmos. Além disso, os códigos também realizam a técnica de análise de componentes principais para reduzir a dimensionalidade das regiões envolvidas na doença de Parkinson. O objetivo desse trabalho é entender melhor a atividade neural na doença de Parkinson e também em um estado saudável.

### Pré-requisitos
Para executar os códigos desse repositório, é necessário ter o Matlab instalado em sua máquina. Os códigos foram testados na versão R2021a, mas devem funcionar em outras versões.

### Como usar
Para executar o código, siga as seguintes etapas:

Faça o download ou clone este repositório.
- Abra o Matlab e navegue até a pasta onde os códigos foram salvos.
- Abra o arquivo main.m.
A- ltere os parâmetros de acordo com as suas necessidades.
- Execute o arquivo main.m.

### Arquivos do repositório
Este repositório contém os seguintes arquivos:

- main.m: arquivo principal que executa as análises iniciais de rastere e aplica a análise PCA ao final.
- means_automatico: arquivo que gera a taxa de disparo automaticamente das regiões, e gera plots de imagens em formato de barras.
- raster_automatico.m: arquivo que gera o raster plot automaticamente das regiões, e gera plots da frequência de disparo de cada neuronônio ao longo do tempo.

### Resultados
Os resultados obtidos com a execução dos códigos podem ser encontrados na pasta "SIMULATIONS 2SEC". Nesta pasta, você encontrará:

- ARQUIVOS COM OS DADOS GERADOS DA SIMULAÇÃO DOS ESTADOS PARKINSONIANOS E SAUDÁVEIS COM E SEM ESTIMULAÇÃO (100PD, 100HT, 100HT_STIM_O, 100PD_STIM_ONN)
- PASTA SERIES E PCA QUE CONTÉM TODOS OS RESULTADOS PARA TODAS AS REGIÕES ENVOLVIDAS NO ESTUDO, ANALISADAS INDIVIDUALMENTE E ANALISADAS EM CONJUNTO (FULL PCA), CONECTADAS COMO SE FOSSE NO CÉREBRO.


### Licença
Este projeto está licenciado sob a licença MIT - consulte o arquivo LICENSE.md para obter mais detalhes.