*** Settings ***
Documentation     A Personal detail resource file with info features
Library           SeleniumLibrary

*** Variables ***
${add}            xpath:(//button[@type="button"])[3]
${Name}           xpath=(//input[@data-v-1f99f73c])[2]
${Relationship}        xpath=(//div[@data-v-67d2aedf])[2]
${DOB}               xpath=(//input[@data-v-1f99f73c])[2]
${save}                 xpath:(//button[text()=" Save "])[1]
${success_save}         xpath://p[text()='Successfully Updated']
${child}              xpath://span[text()='Child']
${other}        xpath://span[text()='Other']
${cancel}     xpath:(//button[@type="button"])[3]    

*** Keywords ***
Fill the details
    [Arguments]    ${names}      
    Input Text    ${Name}     ${names}
    
select relationship as child
    Click Element    ${Relationship}
    Wait Until Element Is Visible    ${Relationship}   10s
    Wait Until Element Is Enabled    ${Relationship}    10s
    Click Element    ${child}

select relationship as Other
    Click Element    ${Relationship}
    Wait Until Element Is Visible    ${Relationship}   10s
    Wait Until Element Is Enabled    ${Relationship}    10s
    Click Element    ${other}


click add button
    Click Button    ${add}

Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated

Click cancel Button
    Click Button    ${cancel} 