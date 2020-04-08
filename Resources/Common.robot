*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER} =  chrome
${URL} =  https://www.argentina.gob.ar/precios-cuidados

*** Keywords ***
Begin Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Test
    Close All Browsers