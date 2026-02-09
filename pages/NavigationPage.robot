*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go To Add Item Page
    Click Element    xpath=//a[@href="#add-item"]

Go To Todo Page
    Click Element    xpath=//a[@href="#todo"]

Go To Completed Page
    Click Element    xpath=//a[@href="#completed"]
