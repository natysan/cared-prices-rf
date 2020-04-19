*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DOWNLOAD_BUTTON_ANDROID} =  xpath=//div[@id="block-system-main"]//div[contains(@class,"pane-campo")]//a/i[contains(@class,"android")]/..
${DOWNLOAD_BUTTON_IOS} =  xpath=//div[@id="block-system-main"]//div[contains(@class,"pane-campo")]//a/i[contains(@class,"apple")]/..
${ANDROID_LOGO} =  css=div[id="block-system-main"] div[class*="pane-campo"] h1>i[class*="android"]
${GOOGLE_PLAY_STORE_OF_LOGO} =  xpath=//*[@id="gbq1"]/div/a/img
${IOS_LOGO} =  css=div[id="block-system-main"] div[class*="pane-campo"] h1>i[class*="apple"]

*** Keywords ***
Landing page for Precios Cuidados should be rendered correctly
    Wait Until Page Contains  Ahora podés tener precios cuidados en tu celular.
    Page Should Contain Link  ${DOWNLOAD_BUTTON_ANDROID}
    Page Should Contain Link  ${DOWNLOAD_BUTTON_IOS}
    Page Should Contain Element  ${ANDROID_LOGO}
    Page Should Contain Element  ${IOS_LOGO}


Click on DESCARGAR for Android
    Click Link  ${DOWNLOAD_BUTTON_ANDROID}


Click on DESCARGAR for Apple
    Click Link  ${DOWNLOAD_BUTTON_IOS}


iOS App Store is rendered
    Wait Until Page Contains  App Store
    Wait Until Page Contains  Presidencia de la Nación Argentina
    Wait Until Page Contains  Precios Cuidados Argentina


Android Google Play store is rendered
    Page Should Contain Element  ${GOOGLE_PLAY_STORE_OF_LOGO}
    Wait Until Page Contains  Precios Cuidados
    Wait Until Page Contains  Presidencia de la Nación Argentina

