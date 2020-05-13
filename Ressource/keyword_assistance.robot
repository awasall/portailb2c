*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py


*** Keywords ***

#----------------------------------------------------------  ASSISTANCE  -----------------------------------------------
#cest ce qu on a mis sur squash
Cliquer sur Assistance
    Wait Until Element Is Enabled    ${link_Assistance_REC}
    Click Element    ${link_Assistance_REC}

Verifier si on est rediriger vers la page Service client
    Wait Until Location Is    ${url_ServiceClient_PREPROD}