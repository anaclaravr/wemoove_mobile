# WeMoove

WeMoove é um aplicativo mobile colaborativo voltado para o transporte público, com o objetivo de prever com mais precisão a chegada dos ônibus nos pontos, utilizando a localização dos próprios passageiros.

## Objetivo

Melhorar a experiência de quem utiliza o transporte público, oferecendo informações em tempo real sobre a aproximação dos ônibus, mesmo diante de imprevistos como trânsito intenso, acidentes ou mudanças no trajeto.

## Como funciona

Diferente dos aplicativos tradicionais que dependem apenas do rastreamento dos veículos, o WeMoove utiliza a localização dos usuários que estão dentro do ônibus (ativada via aplicativo) para estimar sua posição atual. Com isso, o sistema fornece previsões mais confiáveis de chegada aos pontos, ajudando os usuários a se planejarem melhor e evitarem atrasos.

## Tecnologias utilizadas

- Flutter (aplicativo mobile)
- SQLite (persistência local)
- Geolocalização via GPS
- GitHub (controle de versão)

## Funcionalidades previstas

- Cadastro e login de usuários
- Ativação da localização do passageiro dentro do ônibus
- Previsão da chegada dos ônibus nos pontos
- Interface moderna e intuitiva
- Histórico de trajetos e horários
- Sistema de check-in colaborativo

## Figma 

https://www.figma.com/proto/vfyEWsVeP0WSw8eQZ7xcmn/WeMoove-%7C-Mobile?node-id=3-2&t=9RLXI5jovYiYjGRU-1

## Como rodar o projeto

```bash
# Clone o repositório
git clone https://github.com/anaclaravr/wemoove_mobile

# Acesse a pasta do projeto
cd wemoove_mobile

# Instale as dependências
flutter pub get

# Execute o aplicativo
flutter run

