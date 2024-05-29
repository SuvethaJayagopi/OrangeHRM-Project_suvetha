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
    [Tags]    Smoke
    [Arguments]    ${Num}
    Run Keyword And Ignore Error    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait    5
    Run Keyword And Ignore Error    LoginResources.verify the valid credentials
    Run Keyword And Ignore Error    MyInfoResource.click myInfo Button
    Run Keyword And Ignore Error    MyInfoResource.click immigration element
    Run Keyword And Ignore Error    ImmigrationResources.click add button
    Run Keyword And Ignore Error    ImmigrationResources.Fill the details    ${Num}
    Run Keyword And Ignore Error    ImmigrationResources.select country
    Run Keyword And Ignore Error    ImmigrationResources.Click Save Button
