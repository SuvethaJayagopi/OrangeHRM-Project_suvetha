*** Settings ***
Documentation        test forgot password to login page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/ForgotPasswordResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Test Cases ***
validate successful reset password
    ForgotPasswordResources.click forgot password
    ForgotPasswordResources.Fill valid username
    ForgotPasswordResources.click reset button
    ForgotPasswordResources.verify successful password page

validate successful cancel reset password
    ForgotPasswordResources.click forgot password
    ForgotPasswordResources.Fill valid username
    ForgotPasswordResources.click cancel button
    ForgotPasswordResources.verify successful cancel page


