# TCC
Projeto de TCC denominado "Identificação não invasiva de cargas elétricas residenciais utilizando características de regime transitório e permanente"

# Arduino IDE 1.8.9 
Arquivo main.ino contém o código de aquisição de dados utilizando o monitor serial do Arduino

# MatLab R2018a
Arquivos L_.m são referentes à construção do banco de dados para cada uma das possíveis configurações do problema.
Arquivo main.m convoluciona as configurações anteriores, inicia a ferramenta NNTOOL (para criação das redes neurais), além de separar a base de dados nos vetores utilizados na validação cruzada e, por fim, avalia a taxa de erro de cada rede.
Aquivos MLP_OUTPUTS_.mat contemplam as variáveis utilizadas nos testes realizados na segunda montagem: 4 lâmpadas distintas e, respectivamente, 4 lâmpadas idênticas.

Arquivos .png indicam os hiperparâmetros utilizados na construção das redes neurais e uma foto da montagem da plataforma.
