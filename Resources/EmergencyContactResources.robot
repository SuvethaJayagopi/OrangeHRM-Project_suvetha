*** Settings ***
Documentation     A Personal detail resource file with info features
Library           SeleniumLibrary

*** Variables ***
${add}            xpath:(//button[@type="button"])[3]
${Name}           xpath=(//div[@data-v-957b4417]//input)[1]
${Relationship}        xpath=(//div[@data-v-957b4417]//input)[2]
${home}               xpath=(//div[@data-v-957b4417]//input)[3]
${mobile}             xpath=(//div[@data-v-957b4417]//input)[4]
${work_telephone}         xpath=(//div[@data-v-957b4417]//input)[5]
${save}                 xpath:(//button[text()=" Save "])[1]
${success_save}         xpath://p[text()='Successfully Updated']


*** Keywords ***
Fill the details
    [Arguments]    ${names}    ${relation}    ${home_tele}    ${mob}    ${work_tele}    
    Input Text    ${Name}     ${names}
    Input Text    ${Relationship}      ${relation}
    Input Text    ${home}     ${home_tele}
    Input Text    ${mobile}     ${mob}
    Input Text    ${work_telephone}    ${work_tele}
    

click add button
    Click Button    ${add}

Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated 
