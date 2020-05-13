*** Settings ***
Library  SeleniumLibrary
#Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py


*** Keywords ***
####################################
Page d'accueil
    Go To  ${preprod}
Verification page chargee
   title should be  Orange Sénégal|Mobile, pass internet, Orange Money, ADSL Fibre | Portail Orange SN
Click boutton aller new webapp
   click link  ${bouton_pour_new_app}

verification nouvelle webapp accedee
    select window  title=Orange et Moi
    title should be  Orange et Moi
   # page should contain  Revenir vers l’ accueil

######################################