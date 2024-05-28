*** Settings ***
Documentation        Test contact details to my info
Library              SeleniumLibrary
Library              DataDriver    file=../TestData/ContactData.xlsx    sheet_name=contact
Resource             ../Resources/GenericResources.robot
Resource             ../Resources/LoginResources.robot
Resource             ../Resources/ContactDetailsResources.robot
Resource             ../Resources/MyInfoResource.robot
Task Setup           Open the browser with url
Test Teardown        Close browser session
Test Template        validate successful saved contact details

*** Variables ***
${username}    Admin   
${password}    admin123

*** Test Cases ***
fill contact details    ${Srts1}    ${Srts2}    ${City}    ${States}     ${Zip_codes}    ${Homes}    ${Mobiles}    ${Works}    ${Work_emails}    ${Other_emails}

*** Keywords ***
#To validate successful saved contact
validate successful saved contact details
    [Arguments]    ${Srts1}    ${Srts2}    ${City}    ${States}     ${Zip_codes}    ${Homes}    ${Mobiles}    ${Works}    ${Work_emails}    ${Other_emails}
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    MyInfoResource.click myInfo Button
    MyInfoResource.click contact details element
    ContactDetailsResources.Fill the details     ${Srts1}    ${Srts2}    ${City}    ${States}     ${Zip_codes}    ${Homes}    ${Mobiles}    ${Works}    ${Work_emails}    ${Other_emails}
    ContactDetailsResources.select country
    ContactDetailsResources.Click Save Button
