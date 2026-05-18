# ECM QA Automation

## Objetivo
Automação de testes E2E utilizando Robot Framework, com foco na validação de comportamento da aplicação via UI e estado interno (localStorage).

---

## Tecnologias
- Robot Framework  
- Browser Library (Playwright)  

---

## Cenários implementados

### Autenticação
- CT01 — Acesso à aplicação  
- CT02 — Login com credenciais válidas  
- CT03 — Login com credenciais inválidas  

### Produtos e Busca
- CT04 — Acesso à página de produtos  
- CT05 — Busca por produto existente  
- CT06 — Busca por produto inexistente  

### Carrinho
- CT07 — Adição de produto ao carrinho  
- CT08 — Adição de múltiplos produtos ao carrinho  

---

## Estratégia de Automação

- Validação baseada em **comportamento real da aplicação**:
  - UI (lista de produtos, mensagens, contador)
  - `localStorage` (persistência do carrinho)

- Uso de **estratégias de espera explícita** para lidar com comportamento assíncrono (ex: busca com debounce)

- Separação clara de responsabilidades:
  - **tests** → cenários BDD (legíveis e orientados a negócio)  
  - **flows** → orquestração dos passos  
  - **pages** → interação com UI e validações  
  - **common/config** → infraestrutura e configuração  

- Reutilização de steps e centralização de dados em `variables.yaml`

---

## Configuração
Execução controlada por variável de ambiente:

- Local → browser visível  
- CI → headless  

---

## Como executar

```bash
pip install -r requirements.txt
rfbrowser init
robot -d results tests/
``
