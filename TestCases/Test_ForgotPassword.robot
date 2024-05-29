*** Settings ***
Documentation        Test forgot page to my login page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ForgotPasswordResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Test Cases ***
#To validate successful reset password
validate successful reset password
    [Tags]    Regression
    ForgotPasswordResources.click forgot password
    ForgotPasswordResources.Fill valid username
    ForgotPasswordResources.click reset button
    ForgotPasswordResources.verify successful password page

#To validate successful cancel reset password
validate successful cancel reset password
    [Tags]    Regression
    ForgotPasswordResources.click forgot password
    ForgotPasswordResources.Fill valid username
    ForgotPasswordResources.click cancel button
    ForgotPasswordResources.verify successful cancel page


