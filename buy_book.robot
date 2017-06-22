*** Settings ***
Library  Selenium2Library

*** Variables ***
${Empik}    http://www.empik.com
${Log}

*** Test Cases ***
Buy a book
    Open  ${Empik}
    Search
    Choose Product
    Add to basket
    Go to basket
    Pay for product
    Buy without registration
    # [Teardown]  close all browsers

*** Keywords ***
Open
    [Arguments]  ${url}
    open browser  ${url}  chrome
    # Maximize Browser Window
    log to console  Open *** DONE! ***
    [Return]  Yo

Search
    input text  //*[@id="bq"]  Python
    ${elem}  Get WebElement  //*[@id="searchSet"]/button
    Click Element  ${elem}
    log to console  Search *** DONE! ***

Choose Product
    ${elem_list}  Get WebElement  css=.search-list-item-hover .seoImage[title*="The Album"]
    Click Element  ${elem_list}
    log to console  Choose Product *** DONE! ***

Add to basket
    ${add_to_basket}  Get WebElement  //*[@id="p1099088621"]
    Click Element  ${add_to_basket}
    log to console  Add to basket *** DONE! ***

Go to basket
    ${basket}  Get WebElement  css=[href="/koszyk"]
    Click Element  ${basket}
    log to console  Add to basket *** DONE! ***

Pay for product
    ${pay}  Get WebElement  css=[href="/koszyk/dostawa-i-platnosc"]
    Click Element  ${pay}
    log to console  Pay for product *** DONE! ***

Buy without registration
    ${buy}  Get WebElement  //button[contains(text(), "rejestracji")]
    Click Element  ${buy}
    log to console  Buy without registration *** DONE! ***