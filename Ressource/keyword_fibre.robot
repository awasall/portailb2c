*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py



*** Keywords ***
#----------------------------------------------     FIBRE     ----------------------------------------------------------
cliquer sur le lien Internet/Fixe/TV
     Click Link    ${link_InternetFixeTV}

cliquer sur offre fibre bi
    Wait Until Element Is Enabled    ${xpath_offreFibreBi}
    Click Element    ${xpath_offreFibreBi}

cliquer sur offre fibre Mega
    Wait Until Element Is Enabled    ${xpath_offreFibreMega}
    Click Element    ${xpath_offreFibreMega}

cliquer sur le lien JeSuisInteresser
    Wait Until Element Is Enabled    ${xpath_JeSuisInteresser}
    Click Element    ${xpath_JeSuisInteresser}

Verifier si on est rediriger vers la page test-fibre
    Wait Until Location Is    ${url_testFibre}
