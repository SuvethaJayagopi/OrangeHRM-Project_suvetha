*** Settings ***
Documentation    Test dependent to my info
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/DependentData.csv    encoding=utf_8    dialect=unix
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/DependentResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved Dependent

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
Fill dependent    ${Name}

*** Keywords ***
#To validate successful saved dependent
validate successful saved Dependent
    [Tags]    Regression
    [Arguments]     ${Name}    
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click dependent element
    DependentResources.click add button
    DependentResources.Fill the details    ${Name}
    DependentResources.select relationship as child
    DependentResources.Click Save Button
