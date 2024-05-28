*** Settings ***
Documentation        Test emergency contact to my info page
Library              SeleniumLibrary
Library              DataDriver    file=../TestData/EmergencyContactData.xlsx    sheet_name=emergency
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/EmergencyContactResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved personal details

*** Variables ***
${username}    Admin   
${password}    admin123


*** Test Cases ***
fill the form of personal details    ${NAMES}    ${RELATION}    ${HOMES}    ${MOBILES}    ${WORK}

*** Keywords ***
#To validate successful saved personal details
validate successful saved personal details
    [Arguments]     ${NAMES}    ${RELATION}    ${HOMES}    ${MOBILES}    ${WORK}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click emergency contact element
    EmergencyContactResources.click add button
    EmergencyContactResources.Fill the details    ${NAMES}    ${RELATION}    ${HOMES}    ${MOBILES}    ${WORK}
    EmergencyContactResources.Click Save Button


