*** Keywords ***

############################
# AÇÕES
############################

Preencher Campo Usuario
    [Arguments]     ${usuario}
    Fill text    id=username    ${usuario}


Preencher Campo Senha
    [Arguments]     ${senha}
    Fill text    id=password   ${senha}


Clicar no Botao Login
    Click    id=btnLogin


############################
# VALIDAÇÕES
############################

Verificar Página Login Carregada
    Wait For Elements State    text="Login - ECM Marketplace"    visible

    ${url}=    Get Url

Validar Status Do Login
     [Arguments]    ${status_esperado}

    Wait For Function
    ...    () => document.getElementById('msg')?.textContent?.trim() !== ""

    Wait For Function
    ...    () => document.getElementById('msg')?.className?.includes("${status_esperado}")

    ${class_value}=    Get Attribute    id=msg    class
    ${message}=    Get Text    id=msg

    Should Contain
    ...    ${class_value}
    ...    ${status_esperado}

    Should Not Be Empty    ${message}
