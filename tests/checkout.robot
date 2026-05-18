*** Settings ***
Resource    ../resources/setup.resource
Resource    ../resources/flows.resource
Variables   ../resources/data/variables.yaml


*** Test Cases ***

CT09 — Usuário deve finalizar a compra com sucesso quando estiver autenticado
    [Documentation]
    ...    Tipo: Teste End-to-End - Happy Path
    ...    Objetivo: Validar que um usuário autenticado consegue finalizar uma compra com sucesso

    Dado que o usuário acessa a aplicação
    E navega para a página de login

    Quando o usuário realiza login com credenciais válidas

    Então o login deve ser realizado com sucesso
    E deve ser redirecionado para a página de produtos
    E o usuário está autenticado

    Quando o usuário adiciona um produto ao carrinho

    E navega para a página de checkout

    E finaliza a compra

    Então a compra deve ser finalizada com sucesso
    E o carrinho deve ser limpo
    E o valor total da compra deve ser atualizado


CT10 — Usuário não deve conseguir finalizar a compra sem autenticação
    [Documentation]
    ...    Tipo: Teste End-to-End - Negativo
    ...    Objetivo: Validar que a compra não pode ser finalizada sem autenticação

    Dado que o usuário acessa a aplicação
    E o usuário não está autenticado
    E navega para a página de produtos

    Quando o usuário adiciona um produto ao carrinho
    E navega para a página de checkout
    E o usuário tenta finalizar a compra

    Então deve ser exibida uma mensagem de erro
    E a compra não deve ser concluída


CT11 — Usuário deve concluir a compra com múltiplos produtos corretamente
    [Documentation]
    ...    Tipo: Teste End-to-End
    ...    Objetivo: Validar que o sistema processa corretamente a compra de múltiplos produtos

    Dado que o usuário acessa a aplicação
    E navega para a página de login

    Quando o usuário realiza login com credenciais válidas

    Então o login deve ser realizado com sucesso
    E deve ser redirecionado para a página de produtos
    E o usuário está autenticado

    E navega para a página de produtos

    Quando o usuário adiciona múltiplos produtos ao carrinho
    E navega para a página de checkout
    E finaliza a compra

    Então a compra deve ser finalizada com sucesso
    E o valor total da compra deve ser atualizado
    E o carrinho deve ser limpo

