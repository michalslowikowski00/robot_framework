*** Settings ***
Library  String
Library  Selenium2Library

*** Variables ***
${rock_website}  http://kamienie.amberteam.pl/
${in_data_str}

*** Test Cases ***
Create Stone
    Open website
    Create stone
    Input data

*** Keywords ***
Open website
    Open Browser  ${rock_website}  chrome
    Log to console  *** DONE! ***

Create stone
    ${create stone}  Get WebElement  css=[href="/pl/crud/create"]
    Click Element  ${create stone}
    log to console  Create Stone *** DONE! ***

Input data
    ${id_str}  String.Generate Random String  3  [LOWER]
    ${id_int}  String.Generate Random String  6  [NUMBERS]
    Input text  id=id  ${id_str}${id_int}
    # Input text  id=id  Sth123456

    Input text  id=name  Kamien_michala
    Input text  id=weight  100
    Select From List By Index  id=color  1

    ${click_on_btn}  Get WebElement  css=.submit
    Click Element  ${click_on_btn}

    Element Should Contain  css=.message  Kamień został dodany pomyślnie.
    log to console  Input Data *** DONE! ***




