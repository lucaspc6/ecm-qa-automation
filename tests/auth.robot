*** Settings ***
Resource    ../resources/setup.resource
Resource    ../resources/flows.resource


***Test Cases*** 
CT01 — Usuário deve acessar a página inicial com sucesso
    [Documentation]  
    ...    Tipo: Teste de Aceitação
    ...    Objetivo: Validar que o usuário consegue acessar a home e navegar para login
        
    Dado que o usuário acessa a aplicação
    Então a página inicial deve ser carregada corretamente
    E navega para a página de login
  

    
CT02 — Usuário deve realizar login com credenciais válidas
    [Documentation]  Tipo: Teste de Aceitação - Happy Path
    ...    Dado que o usuário acessa a página de login
    ...    Quando informa usuário e senha válidos
    ...    E clica no botão de login
    ...    Então alerta de sucesso deve ser disparado -- não ocorre na UI, mas é possível verificar por meio de div que é preenchida com valor de sucesso ou erro.
    ...    E deve ser redirecionado para a página de produtos
    ...    E o estado de autenticação deve ser persistido no localStorage
   
   #Dado
    New Browser    chromium    headless=${HEADLESS}
    New Page    http://localhost:8080/login.html
    Wait for Elements State     text="Login - ECM Marketplace"    state=visible

    #Quando
    Fill text    id=username    valid_user
    Fill text    id=password    secret123
    
    #E
    Click    id=btnLogin
    
    #Então 
    Wait For Elements State    id=msg    attached
    Wait For Function    document.getElementById('msg').className  
    ${class_value}=    Get Attribute    id=msg    class
    Should Be Equal    ${class_value}    success

    # E
    Wait For Elements State    text="Products - ECM Marketplace"    visible

    # E
    #Wait For Function    localStorage.getItem('auth') === "true"
    ${auth_value}=    Evaluate JavaScript    css=body    () => localStorage.getItem('auth')
    Should Be Equal    ${auth_value}    true

CT03 — Usuário não deve realizar login com credenciais inválidas
    [Documentation]  Tipo: Teste de Aceitação - Negativo
    ...    Dado que o usuário acessa a página de login
    ...    Quando informa usuário ou senha inválidos
    ...    E clica no botão de login
    ...    Então alerta de erro deve ser disparado -- não ocorre na UI, mas é possível verificar por meio de div que é preenchida com valor de sucesso ou erro.
    ...    E não deve ser redirecionado
    ...    E o estado de autenticação não deve ser armazenado
    
   
   #Dado
    New Browser    chromium    headless=${HEADLESS}
    New Page    http://localhost:8080/login.html
    Wait for Elements State     text="Login - ECM Marketplace"    state=visible

    #Quando
    Fill text    id=username    user1
    Fill text    id=password    abcdefg
    
    #E
    Click    id=btnLogin
    
    #Então 
    Wait For Elements State    id=msg    attached
    Wait For Function    document.getElementById('msg').className   
    ${class_value}=    Get Attribute    id=msg    class
    Should Be Equal    ${class_value}    error

    # E
    Wait For Elements State    text="Products - ECM Marketplace"    hidden

    # E
    ${auth_value}=    Evaluate JavaScript    css=body    () => localStorage.getItem('auth')
    Should Be Equal    ${auth_value}    ${None}




    

    




