*** Settings ***
Documentation     A resource file with Immigration features
Library           SeleniumLibrary

*** Variables ***
${add}              xpath:(//button[@type="button"])[3]
${Number}           xpath=(//div[@data-v-957b4417]//input[@class='oxd-input oxd-input--active'])[1]
#${Eligible}        document.getElementsByClassName('oxd-input oxd-input--active')[4]
${Eligible}         xpath:(//div[@data-v-957b4417]//input[@class='oxd-input oxd-input--active'])[4]
#${Eligible}        css:div[data-v-957b4417]:nth-of-type(21)
${Text}             xpath://textarea[@data-v-bd337f32]
${save}             xpath:(//button[text()=" Save "])[1]
${success_save}     xpath://p[text()='Successfully Updated']
${cancel}           xpath:(//button[@type="button"])[3]  
${select}           xpath://div[@data-v-67d2aedf]  
${country}          xpath://span[text()='Albania']

*** Keywords ***
#To fill the immigration page details
Fill the details
    [Arguments]    ${num}     
    Input Text    ${Number}     ${num}    
    Input Text    ${Eligible}    Yes
    Input Text    ${Text}    Good
    
#To select country
select country
    Click Element    ${select}
    Wait Until Element Is Visible    ${select}   10s
    Wait Until Element Is Enabled    ${select}    10s
    Click Element    ${country}

#To click add button
click add button
    Click Button    ${add}

#To click Save button 
Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated

#To click cancel button
Click cancel Button
    Click Button    ${cancel} 