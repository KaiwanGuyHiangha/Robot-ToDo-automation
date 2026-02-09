*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Keywords ***
Open Application
    Open Browser    https://abhigyank.github.io/To-Do-List/    chrome
    ...    options=add_argument(--headless);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage)
    Maximize Browser Window

Close Application
    Close Browser
