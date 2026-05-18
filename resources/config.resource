*** Settings ***
Library    OperatingSystem


*** Variables ***
${HEADLESS}    ${None}
${BASE_URL}    http://localhost:8080

${USER_VALIDO}  valid_user
${SENHA_VALIDA}  secret123
${SENHA_INVALIDA}  ffqwefqw12321


*** Keywords ***
Obter Headless
    ${value}=    Get Environment Variable    HEADLESS    False
    RETURN    ${value}





