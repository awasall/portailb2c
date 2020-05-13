*** Settings ***
#Resource  ../Ressource/keyword.robot
Resource  ../Ressource/deplafonnementOM.robot
Resource  ../Ressource/inscriptionOM.robot
Resource  ../Ressource/actu_guide.robot
Resource  ../Ressource/webapp.robot
Resource  ../Ressource/common.robot
Resource    ../Ressource/keyword_PageDacces.robot
Resource    ../Ressource/keyword_illimix.robot
Resource    ../Ressource/keyword_fibre.robot
Resource    ../Ressource/keyword_FormulaireOM.robot
Resource    ../Ressource/keyword_recherche.robot
Resource    ../Ressource/keyword_assistance.robot

Test Setup  Ouverture navigateur
Test Teardown  Fermeture navigateur

*** Test Cases ***
TA_1_Acceder_a_la_nouvelle_page_orangetmoi
    [Tags]  Smoke
    Page d'accueil
    Verification page chargee
    Click boutton aller new webapp
    verification nouvelle webapp accedee
TA_15_Deplafonner_un_compte_OM_depuis_le_portail
     [Tags]  TNR
     Saisie des info et upload des fichiers pour deplfonnement
     Envoyer le formulaire
     valider le deplafonnement
     verifier que le deplafonnement est effectif

TA_9_Creer_un_compte_OM_depuis_le_portail_cas_nominal
     [Tags]  TNR
     Saisie des info et upload des fichiers pour inscription
     Envoyer le formulaire ins
     valider l'inscription
     verifier que l'inscription est effective

TA_10_Creer_compte_OM_avec_tous_les_champs_obligatoires_a_vide
    aller a la page inscription
    verifier qu'on est bien a la page d'inscription
    valider l'inscription sans reiseigner les champs obligatoires
    Verifier presence mesage d'erreurs

TA_11_Creer_compte_OM_depuis_portail_avec_format_de_fichier_non_autorise
     [Tags]  TNR
     Saisie des info et upload des fichiers pour inscription badfile
     Envoyer le formulaire ins
     #valider l'inscription
     verifier que l'inscription a echoue

TA_2_Partager_l_actu_a_ma_connaissance
    Aller a la Rubrique en ce moment chez Orange
    Verifier Page détails de l'offre
    Aller a la Rubrique Partager avec vos amis sur
    Verifier Page rubrique partager avec vos amis
    Selection d'un RS et verification de la redirection vers ce RS pour partage

TA_14_arborescence_guide_vers_la_reponse_recherchee
    Acceder au chat
    Redirection via la page du chat
    Selectionner une raison du contact
    Verifier message de Ibou
    Verifier liste d'aides proposee par Ibou
    Selectionner une raison parmi celles proposées
    Poursuite du tchat avec Ibou
    Verifier existance sous theme
    Selectionner le sous theme questions frequentes
    Redirection vers la page des questions frequentes


# Malick
03MiseAjour Parcours eligibilite
    [Tags]    TA03
    Go to page dacceuil portail preprod
     @{Index}    Create List    1    2       # 1=FibreBi et 2=FibreMega
    :FOR    ${Item}    IN    @{Index}
    \   Cliquer sur le lien Internet/Fixe/TV
    \    #Cliquer sur le lien DecouvrirLoffre du fibre correspondant
    \   Run Keyword If    ${Item}==1    cliquer sur offre fibre bi   ELSE      cliquer sur offre fibre Mega
    \   Cliquer sur le lien JeSuisInteresser
    \   Verifier si on est rediriger vers la page test-fibre
    \   Go Back
    \   Go Back
    \


04AvantageIllimix
    [Tags]    TA04
    Go to page dacceuil portail preprod
    @{Index}    Create List    1    2    3   # 1=New school 2=Allo et 3=Max
    :FOR    ${Item}    IN    @{Index}
    \    Cliquer sur le lien Les Illimix
    \    Scroll to illimix
    \    Run Keyword If    ${Item}==1   Cliquer sur Illimix New    ELSE IF  ${Item}==2  Cliquer sur Illimix Allo    ELSE  Cliquer sur Illimix Max
    \    Run Keyword If    ${Item}==1  Verifier affichage des different pass de l'illimix New  ELSE IF  ${Item}==2  Verifier affichage des different pass de l'illimix Allo    ELSE  Verifier affichage des different pass de l'illimix Max
    \    Scroll to avantage illimix
    \    Cliquer sur avantage d'un illimix
    \    Verifier affichage des infos Anvantage illimix
    \



06Voir Infos sur comment Souscrire a un pass
    [Tags]    TA06
    Go to page dacceuil portail preprod
    @{Index}    Create List    1    2    3   # 1=New school 2=Allo et 3=Max
    :FOR    ${Item}    IN    @{Index}
    \    Cliquer sur le lien Les Illimix
    \    Scroll to illimix
    \    Run Keyword If    ${Item}==1   Cliquer sur Illimix New    ELSE IF  ${Item}==2  Cliquer sur Illimix Allo    ELSE  Cliquer sur Illimix Max
    \    Run Keyword If    ${Item}==1  Verifier affichage des different pass de l'illimix New  ELSE IF  ${Item}==2  Verifier affichage des different pass de l'illimix Allo   ELSE  Verifier affichage des different pass de l'illimix Max
    \    Scroll to comment souscrire
    \    Cliquer sur comment souscrire a un pass d'un illimix
    \    Scroll to infos souscription
    \    Verifier affichage des infos de souscription a un pass illimix
    \



12Creer compte OM avec caracteres speciaux
    [Tags]    TA12
    Go to Formulaire OM
    Creation dossier unique pour le download et le upload des fichiers et la saisie des donnees
    Cliquer sur le bouton ENVOYER
    Verifier le msg d Erreur



16Recherche avec resultat
    [Tags]    TA16
    Go to page dacceuil portail preprod
    Se placer au niveau de licône Recherche
    entrer un texte existant dans la page au niveau du input de recherche
    Cliquer sur l'icône recherche
    Recuperer le resultat de la recherche et tester si c'est different de zero



17Recherche sans resultat
    [Tags]    TA17
    Go to page dacceuil portail preprod
    Se placer au niveau de licône Recherche
    entrer un texte inexistant dans la page au niveau du input de recherche
    Cliquer sur l'icône recherche
    Recuperer le resultat de la recherche et tester si c'est égale à zero