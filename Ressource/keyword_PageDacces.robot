*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py


*** Keywords ***
#---------------------------------    ACCES PAGES    ------------------------------------
Ouvrir un navigateur
    Open Browser    about:blank    chrome
    Maximize Browser Window
Acces page dacceuil portail preprod et l'agrandir
    Open Browser    ${url_portailB2C_PREPROD}   chrome
    Maximize Browser Window
    ${titlePage}=  Get Title
    #Gerer l acces en cas de probleme de confidentialité
    Run Keyword If    '${titlePage}' == 'Erreur liée à la confidentialité'   Run Keywords      Click Element    xpath=//*[@id="details-button"]   AND   Click Element    xpath=//*[@id="proceed-link"]

Acces page dacceuil portail PROD et l'agrandir
    Open Browser    ${url_portailB2C_PROD}   chrome
    Maximize Browser Window

Acces page portail recette illlimix et l'agrandir
    Open Browser    ${url_portailB2C_Illimix_REC}   chrome
    Maximize Browser Window

Acces page dacceuil portail RECETTE
    Open Browser    ${url_portailB2C_REC}   chrome
    Maximize Browser Window



Go to page dacceuil portail preprod
    Go To    ${url_portailB2C_PREPROD}
    ${titlePage}=  Get Title
    #Gerer l acces en cas de probleme de confidentialité
    Run Keyword If    '${titlePage}' == 'Erreur liée à la confidentialité'   Run Keywords      Click Element    xpath=//*[@id="details-button"]   AND   Click Element    xpath=//*[@id="proceed-link"]

Go to page dacceuil portail PROD
    Go To    ${url_portailB2C_PROD}

Go to page dacceuil portail RECETTE
    Go To    ${url_portailB2C_REC}

Go to page portail recette illlimix
    Go To    ${url_portailB2C_Illimix_REC}

