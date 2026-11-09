# A3 - BANCO DE DADOS
# 🩸 Hemocentro Regional Vida

Sistema de gerenciamento de banco de dados para o **Hemocentro Regional Vida**, desenvolvido como parte da avaliação A3 da Unidade Curricular de Banco de Dados.

## 📌 Sobre o projeto

O Hemocentro Regional Vida é uma instituição responsável pela coleta, armazenamento e distribuição de sangue e hemocomponentes para os hospitais da região. O projeto propõe o desenvolvimento de um banco de dados relacional para substituir o controle atualmente realizado por planilhas, centralizando as informações e organizando todas as etapas do processo.

O sistema contempla desde o cadastro dos doadores e a realização das triagens clínicas até o registro das doações, o processamento das bolsas de hemocomponentes e sua distribuição aos hospitais conveniados. Também considera regras de negócio relacionadas aos intervalos entre doações, à aptidão clínica dos doadores e ao controle de validade e disponibilidade das bolsas.

Dessa forma, busca proporcionar maior organização, integridade e eficiência no gerenciamento das informações e no atendimento às solicitações hospitalares.

## 🎯 Objetivos acadêmicos

- Aplicar conceitos de modelagem conceitual, lógica e física.
- Desenvolver um Diagrama Entidade-Relacionamento (DER).
- Construir um modelo relacional com aplicação da 3FN.
- Identificar e documentar as dependências funcionais.
- Desenvolver scripts SQL utilizando DDL, DML e DQL.
- Elaborar consultas utilizando JOINs para geração de relatórios.
- Praticar o desenvolvimento colaborativo com Git/GitHub.

## 🔗 Principais relacionamentos

- Uma unidade de coleta possui vários funcionários.
- Uma unidade de coleta realiza várias triagens.
- Um funcionário pode realizar várias triagens.
- Um doador pode passar por várias triagens.
- Uma triagem apta pode gerar no máximo uma doação.
- Um funcionário pode ser responsável por várias doações.
- Uma doação pode originar uma ou mais bolsas.
- Um hospital pode realizar várias solicitações.
- Uma solicitação pode receber várias bolsas, enquanto cada bolsa pode atender no máximo uma solicitação.

## ⚙️ Regras de negócio

O sistema deve respeitar as seguintes regras:

1. Os doadores devem possuir idade entre 16 e 69 anos para realizar a doação, respeitando os critérios aplicáveis.
2. Somente triagens com resultado apto podem gerar doações.
3. Uma triagem pode gerar no máximo uma doação.
4. O intervalo mínimo entre doações deve ser de 60 dias para homens e 90 dias para mulheres.
5. Cada doação deve gerar uma ou mais bolsas de hemocomponentes.
6. O tipo sanguíneo dos hemocomponentes corresponde ao tipo sanguíneo do doador de origem.
7. Bolsas vencidas não podem ser enviadas aos hospitais e devem ser marcadas como descartadas.
8. Cada bolsa pode atender no máximo uma solicitação hospitalar.

## 🛠️ Tecnologias e ferramentas

- **MySQL:** Sistema Gerenciador de Banco de Dados (SGBD).
- **SQL:** Linguagem utilizada para definição, manipulação e consulta dos dados.
- **Draw.io:** Ferramenta para elaboração dos diagramas de modelagem.

## 👥 Integrantes


| Nome                          | Matrícula      | GitHub                     |
|-------------------------------|----------------|----------------------------|
| Eduardo Severino de Jesus    | 1072514795     | [edujesusss](https://github.com/edujesusss) |
| Gabriel Machado da Fonseca   | 10725115066    | [Machadox18](https://github.com/Machadox18) |
| Gabriel Rodrigues Victurino  | 10725113959    | [gabriel-victurino](https://github.com/gabriel-victurino) |
| João Rodrigo Fortkamp Silva  | 10725111602    | [joao-fortkamp06](https://github.com/joao-fortkamp06) |

---
## 💡 Observações finais

Desenvolvido para fins acadêmicos como parte da avaliação A3 da Unidade Curricular de Banco de Dados.

Seu propósito é aplicar conceitos de modelagem, normalização e desenvolvimento de bancos de dados relacionais em um cenário de gerenciamento de coleta, armazenamento e distribuição de sangue e hemocomponentes.
