*** Settings ***
Documentation        change password to dashboard page
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
#To validate succcessful change password
validate successful change password
    [Tags]    UAT
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${currentPassword}    ${Password}    ${confirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.verify successful update message

#To verify invalid current password
Verify invalid current password 
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${invalid_password}    ${Password}    ${confirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.Verify error message for incorrect current message

#To verify invalid confirm password
Verify invalid confirm password
    [Tags]   Smoke 
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials    
    ChangePasswordResources.click user icon
    ChangePasswordResources.click change password
    ChangePasswordResources.Fill the change password    ${invalid_password}    ${Password}    ${invalidconfirm_password}
    Set Selenium Implicit Wait    3
    ChangePasswordResources.verify error message for incorrect passwords


    



    


