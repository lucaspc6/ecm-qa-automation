*** Keywords ***

############################
# AÇÕES
############################

Navegar Para Login
    Click    id=nav-login


############################
# VALIDAÇÕES
############################

Verificar Página Inicial Carregada
    Wait For Elements State    text="ECM Marketplace - QA Automation Test"    visible

    ${url}=    Get Url
    Should Not Contain    ${url}    login
    Should Not Contain    ${url}    products
