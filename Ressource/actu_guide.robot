*** Settings ***
Library  SeleniumLibrary
#Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py

*** Keywords ***
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
    \  page should contain  Facebook
    \  run keyword if  '${i}'=='Twitter'  Click link  ${twitter_link}
    \  sleep  2
    \  page should contain  Twitter
    \  run keyword if  '${i}'=='Linkedin'  Click link  ${linkedin_link}
    \  sleep  2
    \  page should contain  LinkedIn

##########################################################
Acceder au chat
    Go To  ${guide_prod}
Redirection via la page du chat
    page should contain  Dalal ak Diam
    # image Ibou avec son ordi
    page should contain element  xpath=//*[@id="block-orange-content"]/div[6]/div/div/div[2]/img
    #page should contain  Par rapport à quel sujet souhaitez-vous nous contacter ?
Selectionner une raison du contact
    Click element  ${raison_OM}
Verifier message de Ibou
    page should contain element  css=#block-orange-content > div.contentS.contS > div > div > div.chat-img-ibou > img
    page should contain  Je suis là pour vous aider.
    page should contain  S'agit-il plus précisément de :
Verifier liste d'aides proposee par Ibou
   # page should contain  Création et gestion de compte
    #page should contain  Partenaires
    #page should contain  Transfert
    #page should contain  factures et autres services
    page should contain element  ${rubrique_aide_1}
    page should contain element  ${rubrique_aide_2}
    page should contain element  ${rubrique_aide_3}
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
