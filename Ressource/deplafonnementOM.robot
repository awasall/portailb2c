*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py
#Resource  ../Ressource/common.robot

*** Keywords ***
Saisie des info et upload des fichiers pour deplfonnement
    #Creation dossier de telechargement
    ${now}    Get Time    epoch
    ${download directory}  Join Path  ${OUTPUT DIR}  downloads_${now}  #je mets dans le dossier du projet download_XXXX
    Create Directory    ${download directory}  #je cree reellement le dossier download_XXXX
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # list of plugins to disable. disabling PDF Viewer is necessary so that PDFs are saved rather than displayed
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.plugins_disabled=${disabled}
    Call Method    ${chrome options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Create File  ${download directory}/monfichier.png
    Create File  ${download directory}/monfichier.xlsx
    aller a la page de deplafonnement
    verifier qu'on est bien a la page de deplafonnement
    telecharger le formulaire
    remplir les champs
    choose file  id=form-signe  ${download directory}/formulaire_inscription_om_original.pdf
    choose file  id=cin-recto  ${download directory}/monfichier.png
    choose file  id=cin-verso  ${download directory}/monfichier.png

Envoyer le formulaire
    Click button  ${bouton_envoyer_deplaf}
    Wait Until Element Is Visible  ${fenetre_validation_deplaf}
valider le deplafonnement
    Click element  ${valider_deplaf}
verifier que le deplafonnement est effectif
    sleep  3
    ${urlcourant}=  Get location
    log  ${urlcourant}
    should be equal  ${urlcourant}  https://newportailb2c.orange-sonatel.com/orange-money
    #####==#####
aller a la page de deplafonnement
    Go to  ${prepDeplaf}
verifier qu'on est bien a la page de deplafonnement
    ${urldep}  Get location
    should be equal  ${urldep}  https://newportailb2c.orange-sonatel.com/deplafonnement-orange-money

