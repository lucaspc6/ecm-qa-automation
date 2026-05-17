*** Keywords ***

Verificar Página Produtos Carregada
    Wait For Elements State    text="Products - ECM Marketplace"    visible

Não Deve Estar Na Página De Produtos
    ${url}=    Get Url
    Should Not Contain    ${url}    products
