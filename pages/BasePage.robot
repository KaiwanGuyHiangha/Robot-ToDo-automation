*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections

*** Variables ***
${BASE_URL}    https://abhigyank.github.io/To-Do-List/

*** Keywords ***
Open Application
    ${driver_path}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install()    sys, webdriver_manager.chrome
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}=    Set Variable    C:/Program Files/Google/Chrome/Application/chrome.exe
    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create Webdriver    Chrome    executable_path=${driver_path}    options=${options}
    Go To    https://www.google.com

    Create Webdriver    Chrome    options=${options}
    Go To    https://www.google.com

    Open Browser    ${BASE_URL}    chrome    options=${options}
    Maximize Browser Window

Close Application
    Close Browser
