*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CARED_PRICES_LIST_LINK} =  xpath=//*[@id="block-system-main"]/section[1]/div/div/div/div/div[1]/a
${CARED_PRICES_URL} =  https://www.argentina.gob.ar/precios-cuidados
${CARED_PRICES_APP_DOWNLOAD_LINK} =  xpath=//*[@id="block-system-main"]/div[1]/div/section/div[3]/div/div/div/a
${CARED_PRICES_LOGO} =  xpath=//*[@id="block-system-main"]/div[1]/div/section/div[3]/div/div/div/p[1]/img


*** Keywords ***

Landing page for Precios Cuidados should be rendered correctly
    Wait Until Page Contains  Precios Cuidados
    Page Should Contain Link  ${CARED_PRICES_APP_DOWNLOAD_LINK}
    Page Should Contain Image  ${CARED_PRICES_LOGO}


Navigate to Precios Cuidados
    Go to  ${CARED_PRICES_URL}


Click on DESCARGA LA APLICACION
    Click Element  ${CARED_PRICES_APP_DOWNLOAD_LINK}


Navigate to Listado de Precios Cuidados
    Go To  ${CARED_PRICES_URL}
    Click Element  ${CARED_PRICES_LIST_LINK}