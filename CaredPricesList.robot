*** Settings ***
Library  SeleniumLibrary
Library  ../../Libraries/MyFunctions.py

*** Variables ***
${PAGE_TITLE} =  Listado de productos de Precios Cuidados
${URL_CARED_PRICES_LIST} =  https://www.argentina.gob.ar/precios-cuidados/listado-de-productos
${COMBO_ZONA} =  id=selectZona
${COMBO_CATEGORIA} =  id=ponchoTableFiltro
${MULTI_FILTER_INPUT} =  id=ponchoTableSearch
${RESULTS_TABLE} =  id=ponchoTable
${RESULTS_TABLE_ROWS} =  css=#ponchoTable > tbody > tr
${RESULTS_TABLE_PAGINATOR} =  id=ponchoTable_paginate
${RESULTS_TABLE_PAGINATOR_BUTTONS} =  xpath=//*[@id="ponchoTable_paginate"]//li/a
${RESULTS_TABLE_PAGINATOR_PREVIOUS} =  id=ponchoTable_previous
${RESULTS_TABLE_PAGINATOR_NEXT} =  id=ponchoTable_next
${TOTAL_RESULTS_TABLE_LABEL} =  id=ponchoTable_info

*** Keywords ***
Listado Precios Cuidados page is rendered correctly
    Wait Until Page Contains  ${PAGE_TITLE}
    Page Should Contain Element  ${COMBO_ZONA}
    Page Should Contain Element  ${COMBO_CATEGORIA}
    Page Should Contain Element  ${MULTI_FILTER_INPUT}
    Results table is displayed
    Page Should Contain Element  ${TOTAL_RESULTS_TABLE_LABEL}
    Table is not empty


Table is not empty
    Search results are more or equal than  0


Select Zona
    Element Should Be Enabled  ${COMBO_ZONA}
    Click Element  ${COMBO_ZONA}
    Select From List By Label  ${COMBO_ZONA}  Patagonia
    Press Keys  ${COMBO_ZONA}  RETURN


Select Categoria
    Element Should Be Enabled  ${COMBO_CATEGORIA}
    Click Element  ${COMBO_CATEGORIA}
    Select From List By Label  ${COMBO_CATEGORIA}  Bebés
    Press Keys  ${COMBO_CATEGORIA}  RETURN


Search by description
    [Arguments]  ${searchterm}
    Element Should Be Enabled  ${MULTI_FILTER_INPUT}
    Click Element  ${MULTI_FILTER_INPUT}
    Input Text  ${MULTI_FILTER_INPUT}  ${searchterm}
    Sleep  10s


Search result is valid
    [Arguments]  ${searchby}  ${searchterm}
    ${colindex} =  Run Keyword If  """${searchby}""" == """category"""  Set Variable  2
    ...  ELSE IF  """${searchby}""" == """EAN"""  Set Variable  4
    ...  ELSE  Set Variable  1
    Result Is Valid  ${RESULTS_TABLE}  ${colindex}  ${searchterm}


Results table is displayed
    Wait Until Element Is Visible  ${RESULTS_TABLE}
    Page Should Contain Element  ${RESULTS_TABLE}
    Wait Until Element Is Visible  ${RESULTS_TABLE_PAGINATOR}
    Page Should Contain Element  ${RESULTS_TABLE_PAGINATOR}


Search returns expected number of results
    [Arguments]  ${expectedresults}
    ${countResults} =  Get Element Count  ${RESULTS_TABLE_ROWS}
    Convert To Integer  ${expectedresults}
    Should Be Equal As Integers  ${expectedresults}  ${countResults}


Result is valid
    [Arguments]  ${whichtable}  ${whichcolumn}  ${whichterm}
    ${cellValue} =  Get Table Cell  ${whichtable}  2  ${whichcolumn}
    Should Be Equal As Strings  ${cellValue}  ${whichterm}


Search results are less than
    [Arguments]  ${expectedresults}
    ${countResults} =  Get Element Count  ${RESULTS_TABLE_ROWS}
    Convert To Integer  ${expectedresults}
    Should Be True  ${expectedresults} > ${countResults}


Search results are more or equal than
    [Arguments]  ${expectedresults}
    ${totalResults} =  Get Text  css=#ponchoTable_info
    @{results} =  Split Phrase  ${totalResults}
    Convert To Integer  @{results}[0]
    Should Be True  ${expectedresults} <= @{results}[0]


Table paginator previous is disabled
    ${prev} =  Get Element Attribute  ${RESULTS_TABLE_PAGINATOR_PREVIOUS}  class
    Should Contain  ${prev}  disabled


Table paginator next is disabled
    ${next} =  Get Element Attribute  ${RESULTS_TABLE_PAGINATOR_NEXT}  class
    Should Contain  ${next}  disabled


Table paginator previous is enabled
    ${prev} =  Get Element Attribute  ${RESULTS_TABLE_PAGINATOR_PREVIOUS}  class
    Should Not Contain  ${prev}  disabled


Table paginator next is enabled
    ${next} =  Get Element Attribute  ${RESULTS_TABLE_PAGINATOR_NEXT}  class
    Should Not Contain  ${next}  disabled


Expected Navigation items are correct
    ${totalResults} =  Get Text  css=#ponchoTable_info
    @{results} =  Split Phrase  ${totalResults}
    Convert To Integer  @{results}[0]
    ${expectedTablePages} =  Expected Navigation Pages  @{results}[0]  10
    ${countResults} =  Get Element Count  ${RESULTS_TABLE_ROWS}
    @{xpaths} =  Build Xpath For Pagination Items  ${RESULTS_TABLE_PAGINATOR_BUTTONS}  ${expectedTablePages}
    FOR  ${xpath}  IN  @{xpaths}
        Element Should Be Visible  ${xpath}
        Click Link  ${xpath}
    END




