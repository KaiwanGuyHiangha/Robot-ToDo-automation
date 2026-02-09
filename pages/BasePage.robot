*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections

*** Variables ***
${BASE_URL}    https://abhigyank.github.io/To-Do-List/

*** Keywords ***
Open Application
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${is_local}=    Run Keyword And Return Status    File Should Exist    C:/Program Files/Google/Chrome/Application/chrome.exe
    IF    ${is_local}
        ${options.binary_location}=    Set Variable    C:/Program Files/Google/Chrome/Application/chrome.exe
    END

    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    
    Create Webdriver    Chrome    options=${options}
    Go To    ${BASE_URL}
    Maximize Browser Window

Close Application
    Close Browser

