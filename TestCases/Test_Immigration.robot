*** Settings ***
Documentation    Test Immigration to my info page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/ImmigrationData.csv    encoding=utf_8    dialect=unix
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
Fill dependent    ${Num}   

*** Keywords ***
#To validate successful saved dependent
validate successful saved Dependent
    [Arguments]     ${Num}    
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click immigration element
    ImmigrationResources.click add button
    ImmigrationResources.Fill the details   ${Num}      
    ImmigrationResources.select country
    ImmigrationResources.Click Save Button
