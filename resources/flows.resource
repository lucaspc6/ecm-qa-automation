*** Settings ***
Resource    setup.resource
Resource    pages/home.resource
Resource    pages/login.resource
Resource    config.resource
Resource    pages/products.resource
Resource    common.resource

*** Keywords ***

Dado que o usuário acessa a aplicação
    Abrir Aplicação Na Home

Então a página inicial deve ser carregada corretamente
    Verificar Página Inicial Carregada

E navega para a página de login
    Navegar Para Login
    Verificar Página Login Carregada

Quando o usuário realiza login com credenciais válidas
    Preencher Campo Usuario     ${USER_VALIDO}
    Preencher Campo Senha       ${SENHA_VALIDA}
    Clicar no Botao Login

Quando o usuário realiza login com credenciais inválidas
    Preencher Campo Usuario     ${USER_VALIDO}
    Preencher Campo Senha       ${SENHA_INVALIDA}
    Clicar no Botao Login

Então o login deve ser realizado com sucesso
    Validar Status Do Login    success

Então o login deve falhar
    Validar Status Do Login    error

E deve ser redirecionado para a página de produtos
    Verificar Página Produtos Carregada

E o usuário está autenticado
    Validar Estado De Autenticação    true

E o usuário não está autenticado
    Validar Estado De Autenticação    ${None}

E o usuário não deve ser redirecionado
    Não Deve Estar Na Página De Produtos


