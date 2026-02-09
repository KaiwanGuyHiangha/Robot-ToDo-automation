*** Settings ***
Library    SeleniumLibrary

Resource   ../resources/variables.robot
Resource   ../pages/BasePage.robot
Resource   ../pages/NavigationPage.robot
Resource   ../pages/AddItemPage.robot
Resource   ../pages/TodoPage.robot


Suite Setup     Open Application
Suite Teardown  Close Application

*** Test Cases ***
TC01 Open Website
    Page Should Contain    To Do List

TC02 Navigate Tabs
    Go To Add Item Page
    Location Should Contain  https://abhigyank.github.io/To-Do-List/#add-item


    Go To Todo Page
    Location Should Contain  https://abhigyank.github.io/To-Do-List/#todo

    Go To Completed Page
    Location Should Contain  https://abhigyank.github.io/To-Do-List/#completed


TC03 Cannot Add Empty Todo
    ${before}=    Get Todo Count
    Add Todo Without Text
    ${after}=     Get Todo Count
    Should Be Equal    ${before}    ${after}

TC04 Add / Complete / Delete N Todo Items
    Add N Todo Items    ${ITEM_COUNT}

    Run Keyword If    ${ENABLE_COMPLETE}
    ...    Complete N Todo Items    ${ITEM_COUNT}

    Run Keyword If    ${ENABLE_COMPLETE}
    ...    Go To Completed Page

    Run Keyword If    ${ENABLE_COMPLETE}
    ...    Verify Todo In Completed List    ${ITEM_PREFIX}${ITEM_COUNT}

    Run Keyword If    ${ENABLE_DELETE}
    ...    Delete N Todo Items From Small To Large    ${ITEM_COUNT}
