*** Settings ***
Documentation    to validate login form
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Immigration.csv    encoding=utf_8    dialect=unix
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/ImmigrationResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved Dependent

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
Fill dependent    ${Num}   ${Status}    ${Comment}

*** Keywords ***
validate successful saved Dependent
    [Arguments]     ${Num}   ${Status}    ${Comment}  
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click immigration element
    ImmigrationResources.click add button
    ImmigrationResources.Fill the details   ${Num}    ${Status}    ${Comment}  
    ImmigrationResources.select country
    ImmigrationResources.Click Save Button
