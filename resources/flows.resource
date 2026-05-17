*** Settings ***
Resource    setup.resource
Resource    pages/home.resource
Resource    pages/login.resource

*** Keywords ***

Dado que o usuário acessa a aplicação
    Abrir Aplicação Na Home

Então a página inicial deve ser carregada corretamente
    Verificar Página Inicial Carregada

E navega para a página de login
    Navegar Para Login
    Verificar Página Login Carregada
