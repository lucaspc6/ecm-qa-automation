*** Settings ***
Library    OperatingSystem


*** Variables ***
${HEADLESS}    ${None}
${BASE_URL}    http://localhost:8080


*** Keywords ***
Obter Headless
    ${value}=    Get Environment Variable    HEADLESS    False
    RETURN    ${value}





