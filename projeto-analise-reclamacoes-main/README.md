# Análise de Reclamações de Consumidores – Consumidor.gov.br

## 📌 Descrição do Projeto
Este projeto tem como objetivo realizar uma análise exploratória de dados
sobre reclamações de consumidores no Brasil, utilizando dados públicos
disponibilizados pela plataforma Consumidor.gov.br.

A proposta é demonstrar como a análise de dados pode auxiliar na
identificação de padrões de reclamações, empresas mais reclamadas,
principais tipos de problemas e o status das reclamações registradas
pelos consumidores.

---

## 🎯 Problemática
Com o aumento do consumo de serviços e produtos, especialmente no meio
digital, o número de reclamações feitas por consumidores também cresce.
Essas reclamações refletem falhas em processos de atendimento, cobrança
e entrega, impactando diretamente a experiência do consumidor.

A análise de dados permite transformar essas reclamações individuais em
informações consolidadas, auxiliando empresas e órgãos reguladores na
tomada de decisões e na melhoria dos serviços prestados.

---

## 📊 Fonte de Dados
Os dados utilizados neste projeto foram obtidos a partir do portal de
dados abertos do Consumidor.gov.br, disponível no site dados.gov.br.

- Tipo de dados: Estruturados (CSV)
- Periodicidade: Mensal
- Forma de acesso: Download direto dos arquivos CSV
- Conteúdo principal:
  - Nome da empresa
  - Tipo de problema
  - Data de abertura da reclamação
  - Status da reclamação

Para este projeto, foram selecionados alguns meses de dados, que foram
posteriormente consolidados em um único conjunto de dados.

---

## 🛠️ Coleta e Tratamento dos Dados
Os arquivos CSV disponibilizados utilizam o ponto e vírgula (`;`) como
separador de campos e apresentam codificação de caracteres específica,
sendo necessário ajustar os parâmetros de leitura no Pandas.

As principais etapas de tratamento foram:
- Consolidação dos arquivos mensais em um único DataFrame
- Ajuste do separador e encoding
- Seleção das colunas relevantes
- Tratamento de valores nulos
- Conversão da coluna de data para o formato adequado

---

## 📈 Análise Exploratória de Dados (EDA)
A análise exploratória foi realizada utilizando Python e a biblioteca
Pandas, com foco em responder às seguintes perguntas:

- Quais empresas concentram o maior número de reclamações?
- Quais são os tipos de problemas mais frequentes?
- Qual é a distribuição do status das reclamações?
- Como as reclamações evoluíram ao longo do tempo?

Os resultados da EDA permitiram identificar padrões importantes no
comportamento das reclamações dos consumidores.

---

## 💡 Principais Insights
- Poucas empresas concentram a maior parte das reclamações registradas.
- Os problemas mais frequentes estão relacionados a cobrança e
  atendimento ao consumidor.
- A maioria das reclamações possui status de resolvida, indicando que
  as empresas, em geral, buscam solucionar os problemas apresentados.

---

## 📊 Visualização de Dados
Foi desenvolvido um dashboard no Looker Studio para facilitar a
visualização dos resultados obtidos na análise exploratória.

O dashboard apresenta:
- Ranking das empresas mais reclamadas
- Principais tipos de problemas
- Evolução temporal das reclamações
- Status das reclamações

O link para o dashboard está disponível na pasta `dashboard/`.

---

## 🧰 Ferramentas Utilizadas
- Python
- Pandas
- Google Colab
- Looker Studio
- GitHub


---

## ✅ Conclusão
Este projeto demonstrou como dados públicos podem ser utilizados para
gerar insights relevantes sobre a experiência do consumidor. Mesmo com
uma análise exploratória simples, foi possível identificar padrões e
informações que podem apoiar decisões de melhoria nos serviços
prestados pelas empresas.

## Projeto desenvolvido para fins educacionais no curso de Análise de Dados – EBAC em parceria com a Semantix.
