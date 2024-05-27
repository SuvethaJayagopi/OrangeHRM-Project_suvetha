*** Settings ***
Documentation     A Personal detail resource file with info features
Library           SeleniumLibrary

*** Variables ***
${add}            xpath:(//button[@type="button"])[3]
${Number}           xpath:(//input[@data-v-1f99f73c])[2]
${Eligible}        xpath:(//input[@data-v-1f99f73c])[5]
${Text}               xpath://textarea[@data-v-bd337f32]
${save}                 xpath:(//button[text()=" Save "])[1]
${success_save}         xpath://p[text()='Successfully Updated']
${cancel}     xpath:(//button[@type="button"])[3]  
${select}    xpath://div[@data-v-67d2aedf]  
${country}              xpath://span[text()='Albania']

*** Keywords ***
Fill the details
    [Arguments]    ${num}      ${eligible}    ${text}
    Input Text    ${Number}     ${num}
    Input Text    ${Eligible}    ${eligible}
    Input Text    ${Text}    ${text}
    
select country
    Click Element    ${select}
    Wait Until Element Is Visible    ${select}   10s
    Wait Until Element Is Enabled    ${select}    10s
    Click Element    ${country}

click add button
    Click Button    ${add}

Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated

Click cancel Button
    Click Button    ${cancel} 