*** Settings ***
Documentation  testea la lista de precios cuidados, que haya resultados y eso
Resource  ../Resources/Common.robot
Resource  ../Resources/CaredPrices.robot
Test Setup  Begin Test
Test Teardown  End Test


# robot -d results tests/Cared_Prices_List.robot

*** Test Cases ***

Listado de productos de Precios Cuidados is rendered correctly
    [Documentation]  Verifies that the Precios Cuidados landing page is displayed correctly
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly


Zones can be selected from the Zona combo
    [Documentation]  Verifies that the the results on the Results table can be filtered by zone
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Select Zona


Categories can be selected from the Categoria combo
    [Documentation]  Verifies that the the results on the Results table can be filtered by category
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Select Categoria


Search by description
    [Documentation]  Verifies that the the results on the Results table can be filtered by description
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Search by description  esponja


Searching by a valid EAN returns only one result
    [Documentation]  Verifies that the the results on the Results table can be filtered by EAN and only one result is displayed
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Search by description  7790080033199
    CaredPricesList.Search result is valid  EAN  7790080033199
    CaredPricesList.Search returns expected number of results  1


Paginator elements are disabled when a search returns less than 10 results
    [Documentation]  TC verifies that pagination arrows are disabled when a search returns less than 10 results
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Search by description  chocolate
    CaredPricesList.Search results are less than  10
    CaredPricesList.Table paginator previous is disabled
    CaredPricesList.Table paginator next is disabled


Paginator elements are enabled when a search returns more than 10 results
    [Documentation]  TC verifies that pagination arrows are enabled when a search has more than 10 results
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Search by description  dulce
    CaredPricesList.Search results are more or equal than  10
    CaredPricesList.Table paginator previous is disabled
    CaredPricesList.Table paginator next is enabled


Paginator displayed the correct number of buttons for navigation
    [Documentation]  TC verifies that the number of buttons for pages is correct
    Landing.Navigate to Listado de Precios Cuidados
    CaredPricesList.Listado Precios Cuidados page is rendered correctly
    CaredPricesList.Search by description  dulce
    CaredPricesList.Search results are more or equal than  10
    CaredPricesList.Table paginator previous is disabled
    CaredPricesList.Table paginator next is enabled
    CaredPricesList.Expected Navigation items are correct