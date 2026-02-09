*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections

*** Variables ***
${BASE_URL}    https://abhigyank.github.io/To-Do-List/

*** Keywords ***
Get Driver Path
    ${path}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install()    sys, webdriver_manager.chrome
    Log To Console    \nDriver path is: ${path}
    RETURN    ${path}

Open Application
    ${options}=    Set Variable    add_argument("--headless=new"); add_argument("--no-sandbox")
    Open Browser    https://www.google.com    browser=chrome    options=${options}



    Create Webdriver    Chrome    options=${options}
    Go To    https://www.google.com

    Open Browser    ${BASE_URL}    chrome    options=${options}
    Maximize Browser Window

Close Application
    Close Browser
