# ECM QA Automation

## 🎯 Objetivo
Automação de testes E2E utilizando Robot Framework, com foco em validação de UI e estado da aplicação.

---

## ⚙️ Tecnologias
- Robot Framework  
- Browser Library (Playwright)  

---

## ✅ Cenários implementados
- CT01 — Acesso à aplicação  
- CT02 — Login com credenciais válidas  
- CT03 — Login com credenciais inválidas  

---

## 🧠 Arquitetura
Separação em camadas para melhor organização e escalabilidade:

- **tests** → cenários de negócio (BDD / DSL)  
- **flows** → orquestração dos passos (Dado / Quando / Então)  
- **pages** → interação com UI  
- **common/config** → utilidades e configuração  

---

## ⚙️ Configuração
Execução controlada por variável de ambiente:

- Local → browser visível  
- CI → headless  

---

## 🚀 Como executar

```bash
pip install -r requirements.txt
rfbrowser init
robot -d results tests/
