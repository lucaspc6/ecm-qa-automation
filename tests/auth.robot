***Settings*** 
Library    Browser


***Test Cases*** 
CT01 — Usuário deve acessar a página inicial com sucesso
    [Documentation]  Tipo: Teste de Aceitação 
    ...    Dado que o usuário acessa a aplicação pela URL principal
    ...    Então a página inicial deve ser carregada corretamente
    ...    E deve ser possível navegar para a página de login
    #Dado
    New Browser    chromium    headless=False
    New Page    http://localhost:8080/
    
    #Então
    Wait for Elements State     text="ECM Marketplace - QA Automation Test"    state=visible

    #E
    Click    id=nav-login
    Wait for Elements State     text="Login - ECM Marketplace"    state=visible

    
CT02 — Usuário deve realizar login com credenciais válidas
    [Documentation]  Tipo: Teste de Aceitação - Happy Path
    ...    Dado que o usuário acessa a página de login
    ...    Quando informa usuário e senha válidos
    ...    E clica no botão de login
    ...    Então alerta de sucesso deve ser disparado -- não ocorre na UI, mas é possível verificar por meio de div que é preenchida com valor de sucesso ou erro.
    ...    E deve ser redirecionado para a página de produtos
    ...    E o estado de autenticação deve ser persistido no localStorage
   
   #Dado
    New Browser    chromium    headless=False
    New Page    http://localhost:8080/login.html
    Wait for Elements State     text="Login - ECM Marketplace"    state=visible

    #Quando
    Fill text    id=username    valid_user
    Fill text    id=password    secret123
    
    #E
    Click    id=btnLogin
    
    #Então 
    Wait For Elements State    id=msg    attached
    Wait For Function    document.getElementById('msg').className === "success"
    ${class_value}=    Get Attribute    id=msg    class
    Should Be Equal    ${class_value}    success

    # E
    Wait For Elements State    text="Products - ECM Marketplace"    visible

    # E
    #Wait For Function    localStorage.getItem('auth') === "true"
    ${auth_value}=    Evaluate JavaScript    css=body    () => localStorage.getItem('auth')
    Should Be Equal    ${auth_value}    true




    

    




