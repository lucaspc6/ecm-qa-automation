*** Settings ***
Resource    common.resource

*** Keywords ***
Abrir Aplicação Na Home
    Abrir Navegador
    Limpar Estado Do Browser
    Acessar URL    ${BASE_URL}