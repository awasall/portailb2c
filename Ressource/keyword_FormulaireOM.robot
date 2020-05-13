*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    OperatingSystem
Variables    ../PageObject/variable.py
Variables    ../PageObject/locator.py


*** Keywords ***

#---------------------------------------------   Formulaire OM   ----------------------------------------------------
Go to Formulaire OM
    Go To    ${url_Inscription_OM_PREPROD}

Page Inscription Orange Money
    Go To    ${url_Inscription_OM_PREPROD}
    ${titlePage}=  Get Title
    #Gerer l acces en cas de probleme de confidentialité
    Run Keyword If    '${titlePage}' == 'Erreur liée à la confidentialité'   Run Keywords    Click Element    ${xpath_details}   AND   Click Element    ${xpath_accesPage}


Creation dossier unique pour le download et le upload des fichiers et la saisie des donnees
    ${now}    Get Time    epoch
    ${download directory}  Join Path  ${OUTPUT DIR}  TestDownloads_${now}  #je mets dans le dossier du projet download_XXXX
    Create Directory    ${download directory}  #je cree reellement le dossier download_XXXX
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.plugins_disabled=${disabled}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    #acces page formulaire OM
    Page Inscription Orange Money
    #Telecharger le formulaire a remplir
    Wait Until Element Is Enabled    ${xpath_fichierToDownload}
    Click Element    ${xpath_fichierToDownload}
    #creer le fichier dans le mm dossier
    Create File    ${download directory}/${libelle_fichier_cree}
    #renseigner les donnees
    Renseigner le prenom
    Renseigner le nom
    Renseigner le mail avec caracteres speciaux
    Renseigner le numero
    Sleep    1
    #Upload le formulaire rempli
    Wait Until Element Is Enabled    ${xpath_fichierToUpload}
    choose file    ${xpath_fichierToUpload}    ${download directory}/${libelle_formulaire}
    #Upload cni recto
    Wait Until Element Is Enabled    id=cin-recto
    Choose file    id=cin-recto     ${download directory}/${libelle_fichier_cree}
    #Upload cni verso
    Wait Until Element Is Enabled    id=cin-verso
    Choose file    id=cin-verso    ${download directory}/${libelle_fichier_cree}



Renseigner le prenom
    Wait Until Element Is Enabled    ${xpath_prenom}
    Input Text    ${xpath_prenom}    ${prenom}

Renseigner le nom
    Wait Until Element Is Enabled    ${xpath_nom}
    Input Text    ${xpath_nom}    ${nom}

Renseigner le mail avec caracteres speciaux
    Wait Until Element Is Enabled    ${xpath_mail}
    Input Text    ${xpath_mail}    ${mail}

Renseigner le numero
    Wait Until Element Is Enabled   id=numero
    Press Keys       id=numero    ESC
    Input Text    id=numero    ${num}

Cliquer sur le bouton ENVOYER
    Wait Until Element Is Enabled    ${xpath_btn_envoyer}
    Click Element    ${xpath_btn_envoyer}

Verifier le msg d Erreur
    ${msgValidator}=  Get Element Attribute    ${xpath_mail}    ${validationMsg}
    Should Not Be Empty   ${msgValidator}

