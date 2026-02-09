*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Todo With Text
    [Arguments]    ${text}
    Input Text    id=new-task    ${text}
    Click Element    xpath=//button[.//i[text()="add"]]
    Sleep    0.5s

Add Todo Without Text
    Click Element    xpath=//button[.//i[text()="add"]]
    Sleep    0.5s
