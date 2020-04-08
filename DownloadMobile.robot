*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Landing page for Precios Cuidados should be rendered correctly
    Wait Until Page Contains  Ahora podés tener precios cuidados en tu celular.
    Page Should Contain Link  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[1]/p/a
    Page Should Contain Link  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[2]/p/a
    Page Should Contain Element  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[1]/h1/i
    Page Should Contain Element  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[2]/h1/i


Click on DESCARGAR for Android
    Click Link  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[1]/p/a


Click on DESCARGAR for Apple
    Click Link  xpath=//*[@id="block-system-main"]/section/article/div/div[7]/div/div/div[2]/p/a
    Sleep  30s


iOS App Store is rendered
    Wait Until Page Contains  App Store
    Wait Until Page Contains  Presidencia de la Nación Argentina
    Wait Until Page Contains  Precios Cuidados Argentina


Android Google Play store is rendered
    Page Should Contain Element  xpath=//*[@id="gbq1"]/div/a/img
    Wait Until Page Contains  Precios Cuidados
    Wait Until Page Contains  Presidencia de la Nación Argentina

