*** Settings ***
Resource    ../resources/setup.resource
Resource    ../resources/flows.resource
Variables   ../resources/data/variables.yaml

***Test Cases*** 
CT01 — Usuário deve acessar a página inicial com sucesso
    [Documentation]  
    ...    Tipo: Teste de Aceitação
    ...    Objetivo: Validar que o usuário consegue acessar a home e navegar para login

    Dado que o usuário acessa a aplicação

    Então a página inicial deve ser carregada corretamente

    E navega para a página de login
  
CT02 — Usuário deve realizar login com credenciais válidas
    [Documentation]  
    ...    Tipo: Teste de Aceitação - Happy Path
    ...    Objetivo: Validar que o usuário consegue se autenticar com credenciais válidas

    Dado que o usuário acessa a aplicação
    E navega para a página de login

    Quando o usuário realiza login com credenciais válidas

    Então o login deve ser realizado com sucesso
    E deve ser redirecionado para a página de produtos
    E o usuário está autenticado


CT03 — Usuário não deve realizar login com credenciais inválidas
    
    [Documentation]
    ...    Tipo: Teste de Aceitação - Negativo
    ...    Objetivo: Validar que o sistema impede autenticação com credenciais inválidas
    
    Dado que o usuário acessa a aplicação
    E navega para a página de login

    Quando o usuário realiza login com credenciais inválidas

    Então o login deve falhar
    E o usuário não deve ser redirecionado
    E o usuário não está autenticado







    

    




