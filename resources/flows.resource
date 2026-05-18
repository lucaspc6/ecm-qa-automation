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

Quando o usuário navega para a página de produtos
    Clicar No Menu Produtos

Então o usuário deve estar na página de produtos
    Verificar Página Produtos Carregada

E navega para a página de produtos
    Clicar No Menu Produtos
    Verificar Página Produtos Carregada

Quando o usuário busca por um produto existente
    Set Test Variable   ${produto}     ${PRODUTO_EXISTENTE}
    Preencher Campo De Busca    ${produto}
    Aguardar Resultado Da Busca
    
Então apenas produtos correspondentes devem ser exibidos
    Validar Produtos Correspondentes À Busca    ${produto}

Quando o usuário busca por um produto inexistente
    Set Test Variable    ${produto}    ${PRODUTO_INEXISTENTE}
    Preencher Campo De Busca    ${produto}

Então nenhum produto deve ser exibido na lista
    Validar Lista Vazia

Quando o usuário adiciona um produto ao carrinho
    Set Test Variable    ${produto}    ${PRODUTO_EXISTENTE}
    Adicionar Produto Ao Carrinho    ${produto}

Então o contador do carrinho deve ser atualizado
    Validar Contador Do Carrinho    1

E o produto deve ser persistido no carrinho
     Validar Produto No Carrinho    ${produto}

Quando o usuário adiciona múltiplos produtos ao carrinho
    Set Test Variable    ${produtos}    ${PRODUTOS_MULTIPLOS}

    FOR    ${produto}    IN    @{produtos}
        Adicionar Produto Ao Carrinho    ${produto}
    END

Então o contador do carrinho deve refletir a quantidade adicionada
    ${quantidade}=    Get Length    ${produtos}

    Validar Contador Do Carrinho    ${quantidade}

E todos os produtos devem ser persistidos no carrinho
    FOR    ${produto}    IN    @{produtos}
        Validar Produto No Carrinho    ${produto}
    END



