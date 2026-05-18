*** Settings ***
Library    Browser
Resource   config.resource


***Keywords ***

Abrir Navegador
    ${headless}=    Obter Headless
    New Browser    chromium    headless=${headless}


Acessar URL 
    [Arguments]     ${url}
    New Page    ${url}

Obter Estado De Autenticação
    ${auth_value}=    Evaluate JavaScript    css=body    () => localStorage.getItem('auth')
    RETURN    ${auth_value}

Validar Estado De Autenticação
    [Arguments]    ${estado_esperado}

    ${auth_value}=    Obter Estado De Autenticação
    Should Be Equal    ${auth_value}    ${estado_esperado}
