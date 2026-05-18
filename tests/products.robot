*** Settings ***
Resource    ../resources/setup.resource
Resource    ../resources/flows.resource
Variables   ../resources/data/variables.yaml

***Test Cases***

CT04 — Usuário deve acessar a página de produtos com sucesso
    [Documentation]
    ...    Tipo: Teste de Aceitação
    ...    Objetivo: Validar que o usuário consegue navegar para a página de produtos

    Dado que o usuário acessa a aplicação

    Quando o usuário navega para a página de produtos

    Então o usuário deve estar na página de produtos


CT05 — Usuário deve buscar um produto existente com sucesso
    [Documentation]
    ...    Tipo: Teste de Aceitação - Happy Path
    ...    Objetivo: Validar que a busca retorna produtos correspondentes ao termo informado

    Dado que o usuário acessa a aplicação
    E navega para a página de produtos

    Quando o usuário busca por um produto existente

    Então apenas produtos correspondentes devem ser exibidos


CT06 — Usuário não deve encontrar produtos ao buscar por um termo inexistente
    [Documentation]
    ...    Tipo: Teste de Aceitação - Negativo
    ...    Objetivo: Validar que a busca não retorna resultados para termos inexistentes

    Dado que o usuário acessa a aplicação
    E navega para a página de produtos

    Quando o usuário busca por um produto inexistente

    Então nenhum produto deve ser exibido na lista

CT07 — Usuário deve adicionar um produto ao carrinho com sucesso
    [Documentation]
    ...    Tipo: Teste de Aceitação - Happy Path
    ...    Objetivo: Validar que o usuário consegue adicionar produtos ao carrinho

    Dado que o usuário acessa a aplicação
    E navega para a página de produtos

    Quando o usuário adiciona um produto ao carrinho

    Então o contador do carrinho deve ser atualizado
    E o produto deve ser persistido no carrinho

CT08 — Usuário deve adicionar múltiplos produtos ao carrinho corretamente
    [Documentation]
    ...    Tipo: Teste de Aceitação - Happy Path
    ...    Objetivo: Validar que o usuário consegue adicionar múltiplos produtos ao carrinho

    Dado que o usuário acessa a aplicação
    E navega para a página de produtos

    Quando o usuário adiciona múltiplos produtos ao carrinho

    Então o contador do carrinho deve refletir a quantidade adicionada
    E todos os produtos devem ser persistidos no carrinho
