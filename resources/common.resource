*** Settings ***
Library    Browser
Resource   config.resource


***Keywords ***

Abrir Navegador
    New Browser    chromium    headless=${HEADLESS}

Acessar URL 
    [Arguments]     ${url}
    New Page    ${url}