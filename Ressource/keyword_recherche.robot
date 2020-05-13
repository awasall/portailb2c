*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py


*** Keywords ***

#---------------------------------------------    RECHERCHE   ---------------------------------------------------
Se placer au niveau de licône Recherche
    Mouse Over     ${xpath_iconeRecherche_PREPROD}
    Wait Until Element Is Visible    ${xpath_inputRecherche_PREPROD}
    Click Element    ${xpath_inputRecherche_PREPROD}

entrer un texte existant dans la page au niveau du input de recherche
    Input text    ${xpath_inputRecherche_PREPROD}    ${orange_money}

entrer un texte inexistant dans la page au niveau du input de recherche
    Input text    ${xpath_inputRecherche_PREPROD}    ${text_inexistant}


Cliquer sur l'icône recherche
    Click Element   ${xpath_iconeRecherche_PREPROD}


Recuperer le resultat de la recherche et tester si c'est different de zero
    Wait Until Element Is Enabled    ${xpath_resultatRecherche_PREPROD}
    ${textResultat}=     Get Text   ${xpath_resultatRecherche_PREPROD}
    #recuperer le 1er caractere du resultat cAd le nombre
    ${val}=    Get Substring    ${textResultat}     0    1
    #tester si c est bien different de zero
    Should Not Be Equal    ${val}     0

Recuperer le resultat de la recherche et tester si c'est égale à zero
    Wait Until Element Is Enabled    ${xpath_resultatRecherche_PREPROD}
    ${textResultat}=     Get Text   ${xpath_resultatRecherche_PREPROD}
    #recuperer le 1er caractere du resultat cAd le nombre
    ${val}=    Get Substring    ${textResultat}     0    1
    #tester si c est bien different de zero
    Should Be Equal    ${val}     0
