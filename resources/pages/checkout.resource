*** Keywords ***

############################
# AÇÕES
############################

Clicar No Menu Checkout
    Click    id=nav-checkout


Finalizar Compra
    Click    id=btnFinish


############################
# VALIDAÇÕES
############################

Verificar Página Checkout Carregada
    Wait For Elements State
    ...    text="Checkout - ECM Marketplace"
    ...    visible

    ${url}=    Get Url
    Should Contain    ${url}    checkout

Validar Checkout Realizado Com Sucesso
    Wait For Function
    ...    () => document.getElementById('msg')?.textContent?.trim() !== ""

    Wait For Function
    ...    () => document.getElementById('msg')?.className?.includes('success')

    ${mensagem}=    Get Text    id=msg
    Should Be Equal
    ...    ${mensagem}
    ...    Order placed successfully


Validar Checkout Com Erro
    Wait For Function
    ...    () => document.getElementById('msg')?.textContent?.trim() !== ""

    Wait For Function
    ...    () => document.getElementById('msg')?.className?.includes('error')

    ${mensagem}=    Get Text    id=msg
    Should Be Equal
    ...    ${mensagem}
    ...    User not authenticated


Validar Valor Total Zerado
    Wait For Elements State
    ...    text="0.00"
    ...    visible


Validar Carrinho Não Foi Limpo
    ${cart}=    Evaluate JavaScript
    ...    css=body
    ...    () => localStorage.getItem('cart')

    Should Not Be Equal
    ...    ${cart}
    ...    ${None}


############################
# ESTADO
############################

Validar Carrinho Vazio
    Wait Until Keyword Succeeds
    ...    5x
    ...    500ms
    ...    Carrinho Deve Estar Vazio


Carrinho Deve Estar Vazio
    ${cart}=    Evaluate JavaScript
    ...    css=body
    ...    () => localStorage.getItem('cart')

    Should Be Equal
    ...    ${cart}
    ...    ${None}
