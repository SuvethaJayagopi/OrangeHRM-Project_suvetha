*** Settings ***
Documentation        Test personal details to my info page
Library              SeleniumLibrary
Library              DataDriver    file=../TestData/PersonalDetailsData.xlsx    sheet_name=PersonalDetails
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/PersonalDetailsResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved personal details

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
fill the form of personal details    ${FName}    ${MName}    ${LName}    ${Employee_id}    ${Othr_id}    ${LNumber}

*** Keywords ***
#To validate successful saved personald details
validate successful saved personal details
    [Tags]    Smoke
    [Arguments]    ${FName}    ${MName}    ${LName}    ${Employee_id}    ${Othr_id}    ${LNumber}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click personal details element
    PersonalDetailsResources.clear the element
    PersonalDetailsResources.Fill the details    ${FName}    ${MName}    ${LName}    ${Employee_id}    ${Othr_id}    ${LNumber}
    PersonalDetailsResources.select marital status
    PersonalDetailsResources.Click Gender As Female
    Set Selenium Implicit Wait    10
    PersonalDetailsResources.Click Save Button


