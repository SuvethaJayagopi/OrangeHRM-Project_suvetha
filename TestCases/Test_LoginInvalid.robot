*** Settings ***
Documentation        test invalid login to login page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/LoginData.xlsx    sheet_name=loginInvalid
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session
Test Template    validate unsuccessful login using invalid username


*** Test Cases ***
Login to form using    ${username}    ${password}
 

*** Keywords ***
#To validate unsuccessful login using invalid username
validate unsuccessful login using invalid username
    [Arguments]    ${username}    ${password}
    LoginResources.Fill the login form    ${username}    ${password}
    LoginResources.verify the invalid credentials

#To validate unsuccessful login using invalid password
Validate Unsuccessful login using invalid password
    [Arguments]    ${username}    ${password}
    LoginResources.Fill the login form    ${username}    ${password}
    LoginResources.verify the invalid credentials

validate Successful login using invalid credentials
    [Arguments]    ${username}    ${password}
    LoginResources.Fill the login form    ${username}    ${password}
    LoginResources.verify the invalid credentials
