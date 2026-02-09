*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Verify Todo Exists
    [Arguments]    ${text}
    Page Should Contain    ${text}

Verify Todo Not Exists
    [Arguments]    ${text}
    Page Should Not Contain    ${text}

Complete Todo
    [Arguments]    ${text}
    Click Element
    ...    xpath=//li[.//span[text()="${text}"]]//input[@type="checkbox"]

Verify Todo In Completed List
    [Arguments]    ${text}
    Wait Until Page Contains Element
    ...    xpath=//ul[@id="completed-tasks"]//li[contains(., "${text}")]
    ...    5s

Delete Todo
    [Arguments]    ${text}
    Click Element
    ...    xpath=//li[.//span[text()="${text}"]]//button

Get Todo Count
    ${count}=    Get Element Count    xpath=//li
    [Return]     ${count}

Add N Todo Items
    [Arguments]    ${count}
    ${end}=    Evaluate    ${count} + 1
    FOR    ${i}    IN RANGE    1    ${end}
        ${item}=    Set Variable    ${ITEM_PREFIX}${i}
        Add Todo With Text    ${item}
    END

Complete N Todo Items
    [Arguments]    ${count}
    ${end}=    Evaluate    ${count} + 1
    FOR    ${i}    IN RANGE    1    ${end}
        ${item}=    Set Variable    ${ITEM_PREFIX}${i}
        Complete Todo    ${item}
    END

Delete N Todo Items From Small To Large
    [Arguments]    ${count}
    ${end}=    Evaluate    ${count} + 1
    FOR    ${i}    IN RANGE    1    ${end}
        ${item}=    Set Variable    ${ITEM_PREFIX}${i}
        Delete Todo    ${item}
    END

