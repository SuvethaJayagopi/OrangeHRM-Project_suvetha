*** Settings ***
Documentation     A Personal detail resource file with info features
Library           SeleniumLibrary

*** Variables ***
${street1}    xpath:(//div[@data-v-957b4417]/input)[1]
${street2}    xpath:(//div[@data-v-957b4417]/input)[2]
${city}    xpath:(//div[@data-v-957b4417]/input)[3]
${state}    xpath:(//div[@data-v-957b4417]/input)[4]
${zip_code}    xpath:(//div[@data-v-957b4417]/input)[5]
${home}    xpath:(//div[@data-v-957b4417]/input)[6]
${mobile}    xpath:(//div[@data-v-957b4417]/input)[7]
${work}    xpath:(//div[@data-v-957b4417]/input)[8]
${work_email}    xpath:(//div[@data-v-957b4417]/input)[9]
${other_email}   xpath:(//div[@data-v-957b4417]/input)[10]
${save}    xpath://button[@type="submit"]
${success_save}         xpath://p[text()='Successfully Updated']
${drop_down}    xpath://div[@data-v-67d2aedf]
${country}              xpath://span[text()='Aruba']


*** Keywords ***
Fill the details    
    [Arguments]    ${srt1}    ${srt2}    ${cty}    ${ste}    ${zip}    ${hme}    ${mob}    ${wrk}    ${w_email}    ${o_email}
    Input Text    ${street1}    ${srt1}
    Input Text    ${street2}    ${srt2}
    Input Text    ${city}     ${cty} 
    Input Text    ${state}     ${ste} 
    Input Text    ${zip_code}    ${zip}
    Input Text    ${home}     ${hme} 
    Input Text    ${mobile}     ${mob}
    Input Text   ${work}     ${wrk} 
    Input Text    ${work_email}     ${w_email}
    Input Text    ${other_email}     ${o_email}


select country
    Click Element    ${drop_down}
    Wait Until Element Is Visible    ${drop_down}   10s
    Wait Until Element Is Enabled    ${drop_down}    10s
    Click Element    ${country}

Click Save Button
    Click Button    ${save}
    Should Contain    ${success_save}    Successfully Updated 








