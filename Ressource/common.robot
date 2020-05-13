*** Settings ***
Library  SeleniumLibrary
#Library  OperatingSystem
Variables  ../PageObject/Variable.py
Variables  ../PageObject/locator.py

*** Keywords ***
######## Setup & Teardown  ##########
Ouverture navigateur
    open browser  about:blank  ${browser}
    maximize browser window

Fermeture navigateur
    close all browsers

remplir les champs
    input text  id=prenom  Ousseynou
    input text  id=nom  Sane
    input text  id=mail  weusebaye@gmail.com
    Press keys  id=numero  ESC
    input text  id=numero  774590750

telecharger le formulaire
    Click Element  ${lien_telecharger_form}    # downloads a file