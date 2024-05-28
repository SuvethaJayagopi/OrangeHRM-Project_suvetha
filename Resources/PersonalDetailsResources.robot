*** Settings ***
Documentation     A Personal detail resource file with info features
Library           SeleniumLibrary

*** Variables ***
${firstName}            xpath://input[@name="firstName"]
${middleName}           xpath://input[@name="middleName"]
${lastName}             xpath://input[@name="lastName"]
${emp_id}               xpath:(//input[@class="oxd-input oxd-input--active"])[2]
${other_id}             xpath:(//input[@class="oxd-input oxd-input--active"])[3]
${licenseNumber}        xpath:(//input[@class="oxd-input oxd-input--active"])[4]
${licenseExpiryDate}    xpath:(//input[@class="oxd-input oxd-input--active"])[5]
${ssn_number}           xpath:(//input[@class="oxd-input oxd-input--active"])[6]
${sin_number}           xpath:(//input[@class="oxd-input oxd-input--active"])[7]
${nationality}          xpath:(//div[@class="oxd-select-text-input"])[1]
${marital_status}       xpath:(//div[@class="oxd-select-text-input"])[2]
${DOB}                  xpath:(//input[@class="oxd-input oxd-input--active"])[8]
${male}                 xpath:(//span[@data-v-7ef819fd])[1]
${female}               xpath:(//span[@data-v-7ef819fd])[2]
${save}                 xpath:(//button[text()=" Save "])[1]
${success_save}         xpath://p[text()='Successfully Updated']
${drop_down}            xpath:(//i[@class="oxd-icon bi-caret-down-fill oxd-select-text--arrow"])[2]
${married}              xpath://span[text()='Married']
${calendar_locator}     xpath://i[@class="oxd-icon bi-calendar oxd-date-input-icon"]
${desired_date}         2024-05-28  


*** Keywords ***
#To fill personal details page
Fill the details
    [Arguments]    ${fName}    ${mName}    ${lName}    ${employee_id}    ${othr_id}    ${lNumber}
    Input Text    ${firstName}    ${fName}
    Input Text    ${middleName}    ${mName}
    Input Text    ${lastName}    ${lName}
    Input Text    ${emp_id}    ${employee_id}
    Input Text    ${other_id}    ${othr_id}
    Input Text    ${licenseNumber}    ${lNumber}

#To clear the element
clear the element
    Clear Element Text    ${firstName}
    Clear Element Text    ${middleName}
    Clear Element Text    ${lastName}
    Clear Element Text    ${emp_id}
    Clear Element Text    ${other_id}
    Clear Element Text    ${licenseNumber}

#To select the marital status
select marital status
    Click Element    ${drop_down}
    Wait Until Element Is Visible    ${drop_down}   10s
    Wait Until Element Is Enabled    ${drop_down}    10s
    Click Element    ${married}

#To select the date
Select Date
    [Arguments]    ${date}
    Click Element    xpath://div[text()='${date}']    

#To click Gender as male
Click Gender As Male
    Click Element    ${male}

#To clcik gender as female
Click Gender As Female
    Click Element    ${female}

#To clcik save button
Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated 
