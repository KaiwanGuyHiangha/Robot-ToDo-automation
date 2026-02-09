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
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}=    Set Variable    C:/Program Files/Google/Chrome/Application/chrome.exe
    
    # ใส่ Argument ให้ถูกต้อง (ใช้ \=)
    Call Method    ${options}    add_argument    --headless\=new
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    # ระบุ PATH ของ chromedriver.exe ที่คุณโหลดมาวางไว้ (ตัวอย่างเช่นวางไว้ใน C:/bin/)
    ${driver_path}=    Set Variable    C:/bin/chromedriver.exe
    
    # รันโดยระบุทั้งตำแหน่ง Driver และ Options
    Create Webdriver    Chrome    executable_path=${driver_path}    options=${options}
    Go To    https://www.google.com


    Create Webdriver    Chrome    options=${options}
    Go To    https://www.google.com

    Open Browser    ${BASE_URL}    chrome    options=${options}
    Maximize Browser Window

Close Application
    Close Browser
