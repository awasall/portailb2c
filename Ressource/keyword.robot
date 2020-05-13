*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py

*** Keywords ***
######## Setup & Teardown  ##########
Ouverture navigateur
    open browser  about:blank  ${browser}
    maximize browser window

Fermeture navigateur
    close all browsers
####################################
Page d'accueil
    Go To  ${preprod}
Verification page chargee
   title should be  Orange Sénégal|Mobile, pass internet, Orange Money, ADSL Fibre | Portail Orange SN
   #wait until page contains  Dalal ak Jammci Orange
Click boutton aller new webapp
   # click link  webapp_button
   click link  ${bouton_pour_new_app}

verification nouvelle webapp accedee
    select window  title=Orange et Moi
    page should contain  Revenir vers l’ accueil

######################################
Aller a la Rubrique en ce moment chez Orange
    Go To  ${prod}
Verifier Page détails de l'offre
    page should contain  En ce moment chez Orange
Aller a la Rubrique Partager avec vos amis sur
    Click element  ${lien_partager_avec_vos_amis}
Verifier Page rubrique partager avec vos amis
    page should contain  Descriptif
    page should contain  Partager avec vos amis sur
Selection d'un RS et verification de la redirection vers ce RS pour partage
    :FOR   ${i}  IN  Facebook  Twitter  Linkedin
    \  run keyword if  '${i}'=='Facebook'  Click link  ${facebook_link}
    \  sleep  2
   # \  switch browser  2
    \  page should contain  Facebook
    #\  close browser
    \  run keyword if  '${i}'=='Twitter'  Click link  ${twitter_link}
    \  sleep  2
   # \  switch browser  2
    \  page should contain  Twitter
   # \  close browser
    \  run keyword if  '${i}'=='Linkedin'  Click link  ${linkedin_link}
    \  sleep  2
    #\
    \  page should contain  LinkedIn
    #\  close browser
##########################################################
Acceder au chat
    Go To  ${guide_prod}
Redirection via la page du chat
    page should contain  Dalal ak Diam
    page should contain  Par rapport à quel sujet souhaitez-vous nous contacter ?
Selectionner une raison du contact
    Click element  ${raison_OM}
Verifier message de Ibou
    page should contain element  css=#block-orange-content > div.contentS.contS > div > div > div.chat-img-ibou > img
    page should contain  Je suis là pour vous aider.
    page should contain  S'agit-il plus précisément de :
Verifier liste d'aides proposee par Ibou
    page should contain  Création et gestion de compte
    page should contain  Partenaires
    page should contain  Transfert
    page should contain  factures et autres services
Selectionner une raison parmi celles proposées
    Execute JavaScript    window.scrollTo(0,200)
    Sleep  2
    Click element  ${creation_gestion_compte}
Poursuite du tchat avec Ibou
    page should contain element  css=#block-orange-content > div.contentS.contS > div > div > div.chat-img-ibou > img
    page should contain  Nous vous proposons de consulter nos questions fréquentes.
    page should contain  Si vous ne trouvez toujours pas de solution, n'hésitez pas à me donner davantage de détails via Messenger pour que je puisse prendre en charge personnellement votre demande.
    page should contain  Merci, Ibou à votre service !
Verifier existance sous theme
    page should contain link  ${link_question_freq}
    page should contain link  ${link_trouver_agence}
    page should contain link  ${link_parler_ibou}
Selectionner le sous theme questions frequentes
    Sleep  2
    Click link  ${link_question_freq}
Redirection vers la page des questions frequentes
    page should contain button  ${lien_question_freq1}

######################################################
Acceder a la page d'inscription
    Go To  ${prepCreerCompte}
valider l'inscription sans reiseigner les champs obligatoires
    Click button  ${bouton_envoyer_formulaire}  # aucune saisie , clique directe sur ENVOYER
Verifier presence mesage d'erreurs
    ${msgValidator}=  Get Element Attribute    id=prenom    validationMessage
    Log  ${msgValidator}
    Should Not Be Empty   ${msgValidator}
#########***************************************************************################################################


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
    ${urlcourant}=  Get location
    log  ${urlcourant}
    should be equal  ${urlcourant}  https://newportailb2c.orange-sonatel.com/orange-money
    #####==#####
aller a la page de deplafonnement
    Go to  ${prepDeplaf}
verifier qu'on est bien a la page de deplafonnement
    ${urldep}  Get location
    should be equal  ${urldep}  https://newportailb2c.orange-sonatel.com/deplafonnement-orange-money
telecharger le formulaire
    Click Element  ${lien_telecharger_form}    # downloads a file
remplir les champs
    input text  id=prenom  Ousseynou
    input text  id=nom  Sane
    input text  id=mail  weusebaye@gmail.com
    Press keys  id=numero  ESC
    input text  id=numero  774590750
     #### ==  ######
###########################*************************************####################################

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
aller a la page inscription
     Go to  ${prepCreerCompte}
verifier qu'on est bien a la page d'inscription
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





