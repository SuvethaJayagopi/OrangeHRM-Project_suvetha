*** Settings ***
Documentation        test search to dashboard page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ChangePasswordResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Variables ***
${username}    Admin   
${password}    admin123
${currentPassword}    admin123   
${Password}    User123
${confirm_password}    User123 
${invalid_password}    admin 
${invalidconfirm_password}    User456 

*** Test Cases ***
validate successful change password
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${currentPassword}    ${Password}    ${confirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.verify successful update message

Verify invalid current password 
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${invalid_password}    ${Password}    ${confirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.Verify error message for incorrect current message

Verify invalid confirm password
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${invalid_password}    ${Password}    ${invalidconfirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.verify error message for incorrect passwords


    



    


