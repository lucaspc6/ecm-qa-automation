*** Keywords ***

Verificar Página Login Carregada
    Wait For Elements State    text="Login - ECM Marketplace"    visible

Preencher Campo Usuario
    [Arguments]     ${usuario}
    Fill text    id=username    ${usuario}

Preencher Campo Senha
    [Arguments]     ${senha}
    Fill text    id=password   ${senha}

Clicar no Botao Login
    Click    id=btnLogin

Validar Status Do Login
    [Arguments]    ${status_esperado}
    Wait For Elements State    id=msg    attached
    Wait For Function    document.getElementById('msg').className === "${status_esperado}"
    ${class_value}=    Get Attribute    id=msg    class
    Should Be Equal    ${class_value}    ${status_esperado}



