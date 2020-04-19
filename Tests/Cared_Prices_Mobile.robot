*** Settings ***
Documentation  verifies that the Precios Cuidados app is available and can be downloaded
Resource  ../Resources/Common.robot
Resource  ../Resources/CaredPrices.robot
Test Setup  Begin Test
Test Teardown  End Test


# robot -d results tests/Cared_Prices_Mobile.robot


*** Variables ***
${BROWSER} =  chrome
${URL} =  https://www.argentina.gob.ar/precios-cuidados


*** Test Cases ***
Precios Cuidados landing page is displayed correctly
    Landing.Navigate to Precios Cuidados
    Landing.Landing page for Precios Cuidados should be rendered correctly


Precios Cuidados app download page is displayed correctly after clicking DESCARGA LA APLICACION
    Landing.Navigate to Precios Cuidados
    Landing.Landing page for Precios Cuidados should be rendered correctly
    Landing.Click on DESCARGA LA APLICACION
    DownloadMobile.Landing page for Precios Cuidados should be rendered correctly


Precios Cuidados app available for download on Google Play for Android devices
    Landing.Navigate to Precios Cuidados
    Landing.Landing page for Precios Cuidados should be rendered correctly
    Landing.Click on DESCARGA LA APLICACION
    DownloadMobile.Landing page for Precios Cuidados should be rendered correctly
    DownloadMobile.Click on DESCARGAR for Android
    DownloadMobile.Android Google Play store is rendered


Precios Cuidados app available for download on App Store for iOS devices
    Landing.Navigate to Precios Cuidados
    Landing.Landing page for Precios Cuidados should be rendered correctly
    Landing.Click on DESCARGA LA APLICACION
    DownloadMobile.Landing page for Precios Cuidados should be rendered correctly
    DownloadMobile.Click on DESCARGAR for Apple
    DownloadMobile.iOS App Store is rendered

