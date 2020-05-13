*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py



*** Keywords ***

#-----------------------------------------   LES ILLIMIX    ----------------------------------------------
Cliquer sur le lien Les Illimix
    Click Link    ${link_Les_Illimix}
      #--- clique sur les differents illimix  ---
Cliquer sur Illimix New
    Scroll Element Into View    ${xpath_illimix_New}
    Wait Until Element Is Enabled    ${xpath_illimix_New}
    Click Element    ${xpath_illimix_New}

Cliquer sur Illimix Allo
    Scroll Element Into View    ${xpath_illimix_Allo}
    Wait Until Element Is Enabled    ${xpath_illimix_Allo}
    Click Element    ${xpath_illimix_Allo}

Cliquer sur Illimix Max
    Scroll Element Into View    ${xpath_illimix_Max}
    Wait Until Element Is Enabled    ${xpath_illimix_Max}
    Click Element    ${xpath_illimix_Max}

Cliquer sur Illimix test
    Scroll Element Into View    ${xpath_illimixTest_RECETTE}
    Wait Until Element Is Enabled    ${xpath_illimixTest_RECETTE}
    Click Element    ${xpath_illimixTest_RECETTE}


     #--- verification affichage des differents pass d'un illimix ---
Verifier affichage des different pass de l'illimix test RECETTE
    Wait Until Element Is Visible    ${xpath_passIllimixTest_RECETTE}

Verifier affichage des different pass de l'illimix New
    Wait Until Element Is Visible    ${xpath_passIllimix_New}

Verifier affichage des different pass de l'illimix Allo
    Wait Until Element Is Visible    ${xpath_passIllimix_Allo}

Verifier affichage des different pass de l'illimix Max
    Wait Until Element Is Visible    ${xpath_passIllimix_Max}

      #--- clique sur avantage d'un illimix ---
Cliquer sur avantage d'un illimix
    Wait Until Element Is Enabled    ${xpath_avantageIllimix}
    Click Element     ${xpath_avantageIllimix}

      #--- clique sur Comment souscrire a un pass d'un illimix ---
Cliquer sur comment souscrire a un pass d'un illimix
    Wait Until Element Is Enabled    ${xpath_commentSouscrireIllimix}
    Click Element     ${xpath_commentSouscrireIllimix}

  #--- verification affichage des Infos sur comment souscrire ---
Verifier affichage des infos de souscription a un pass illimix
    Wait Until Element Is Visible    ${xpath_infoSouscriptionIllimix_option1}
    Wait Until Element Is Visible    ${xpath_infoSouscriptionIllimix_option2}
    Wait Until Element Is Visible    ${xpath_infoSouscriptionIllimix_option3}

  #--- verification affichage des Infos Avantage illimix ---
Verifier affichage des infos Anvantage illimix
    Wait Until Element Is Visible    ${xpath_infoAvantageIllimix}


Cliquer sur lien CLIQUER ICI
    Wait Until Element Is Enabled    ${xpath_lienCliquerICI_RECETTE}
    Click Element    ${xpath_lienCliquerICI_RECETTE}

Verifier affichage Pop Up du lien CLIQUER ICI
    Wait Until Element Is Visible    ${xpath_popUp_CliquerICI_RECETTE}


     #------ Scrolling -----
Scroll to illimix
    Wait Until Element Is Enabled    ${xpath_scrollToIlimix}
    Scroll Element Into View   ${xpath_scrollToIlimix}

Scroll to comment souscrire
    Wait Until Element Is Enabled    ${xpath_scrollToCommentSouscrire}
    Scroll Element Into View    ${xpath_scrollToCommentSouscrire}

Scroll to infos souscription
    Wait Until Element Is Enabled    ${xpath_scrollToInfoSouscription}
    Scroll Element Into View    ${xpath_scrollToInfoSouscription}

Scroll to avantage illimix
    Wait Until Element Is Enabled    ${xpath_avantageIllimix}
    Scroll Element Into View    ${xpath_avantageIllimix}
  