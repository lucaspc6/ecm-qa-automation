*** Keywords ***

Verificar Página Produtos Carregada
    Wait For Elements State    text="Products - ECM Marketplace"    visible

Não Deve Estar Na Página De Produtos
    ${url}=    Get Url
    Should Not Contain    ${url}    products

Clicar No Menu Produtos
    Click   id=nav-products

Preencher Campo De Busca
    [Arguments]    ${produto}

    Fill Text    id=q    ${produto}

Aguardar Resultado Da Busca
    Wait Until Keyword Succeeds    5x    200ms
    ...    Validar Produtos Correspondentes À Busca    ${produto}

Validar Produtos Correspondentes À Busca
    [Arguments]    ${produto}

    ${itens}=    Get Elements    css=#tbody tr td:nth-child(2)

    Should Not Be Empty    ${itens}

    FOR    ${item}    IN    @{itens}
        ${texto}=    Get Text    ${item}

        Should Contain
        ...    ${texto.lower()}
        ...    ${produto.lower()}
    END

Validar Lista Vazia
    Wait For Elements State    text=No products found    visible

Adicionar Produto Ao Carrinho
    [Arguments]    ${produto}

    Click
    ...    xpath=//tr[td[contains(text(),"${produto}")]]//button

Validar Contador Do Carrinho
    [Arguments]    ${quantidade}

    ${contador}=    Get Text    id=cart-count

    Should Be Equal As Numbers
    ...    ${contador}
    ...    ${quantidade}

Validar Produto No Carrinho
    [Arguments]    ${produto}

    ${cart}=    Evaluate JavaScript
    ...    css=body
    ...    () => localStorage.getItem('cart')

    Should Contain    ${cart}    ${produto}





