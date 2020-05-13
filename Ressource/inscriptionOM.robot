*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py


*** Keywords ***
######################################################
# ce test contient d'autres keyword definis en bas de fichier comme aller a la page inscription et verif associee
valider l'inscription sans reiseigner les champs obligatoires
    Click button  ${bouton_envoyer_formulaire}  # aucune saisie , clique directe sur ENVOYER
Verifier presence mesage d'erreurs
    ${msgValidator}=  Get Element Attribute    id=prenom    validationMessage
    Log  ${msgValidator}
    Should Not Be Empty   ${msgValidator}
#########***************************************************************################################################

Saisie des info et upload des fichiers pour inscription
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
    aller a la page inscription
    verifier qu'on est bien a la page d'inscription
    telecharger le formulaire
    remplir les champs
    choose file  id=form-signe  ${download directory}/formulaire_inscription_om_original.pdf
    choose file  id=cin-recto  ${download directory}/monfichier.png
    choose file  id=cin-verso  ${download directory}/monfichier.png

Envoyer le formulaire ins
    Click button  id=submit

valider l'inscription
    Wait Until Element Is Visible  xpath=(//div[@id='modal']/div/div)[2]
    Click element  id=end-create
verifier que l'inscription est effective
   # wait until keyword succeeds   Location is  https://newportailb2c.orange-sonatel.com/orange-money
    ${urlcourant}=  Get location
    log  ${urlcourant}
    should be equal  ${urlcourant}  https://newportailb2c.orange-sonatel.com/orange-money
    ######====#######

    # les fontions annexes appelees par les keywords:
aller a la page inscription
     Go to  ${prepCreerCompte}
verifier qu'on est bien a la page d'inscription
      sleep  3
      ${urlins}  Get location
     should be equal  ${urlins}  https://newportailb2c.orange-sonatel.com/formulaire-orange-money



###############################******************************########################################
Saisie des info et upload des fichiers pour inscription badfile
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
    aller a la page inscription
    verifier qu'on est bien a la page d'inscription
    telecharger le formulaire
    remplir les champs
    choose file  id=form-signe  ${download directory}/formulaire_inscription_om_original.pdf
    choose file  id=cin-recto  ${download directory}/monfichier.png
    choose file  id=cin-verso  ${download directory}/monfichier.xlsx

verifier que l'inscription a echoue
  Element should not be Visible  xpath=(//div[@id='modal']/div/div)[2]

