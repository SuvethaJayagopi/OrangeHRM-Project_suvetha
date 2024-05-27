*** Settings ***
Documentation        test valid logout page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ChangePasswordResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
validate successful change password
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click logout
    