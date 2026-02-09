*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${BASE_URL}    https://abhigyank.github.io/To-Do-List/

*** Keywords ***
Open Application
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    "--headless=new"
    Call Method    ${options}    add_argument    "--no-sandbox"
    Call Method    ${options}    add_argument    "--disable-dev-shm-usage"

    Open Browser    ${BASE_URL}    chrome    options=${options}
    Maximize Browser Window

Close Application
    Close Browser
