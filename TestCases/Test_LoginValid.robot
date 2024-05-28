*** Settings ***
Documentation        test valid login to login page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
#To validate successful login using valid credentails
validate Successful login using valid credentials
    [Tags]    UAT
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials

