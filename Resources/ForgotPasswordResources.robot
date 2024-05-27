*** Settings ***
Documentation     A resource file with forgot password features
Library     SeleniumLibrary

*** Variables ***
${username}    xpath://input[@name="username"]
${forgot_password}    xpath://p[text()='Forgot your password? ']
${reset_password}    xpath://button[text()=' Reset Password ']
${cancel_button}    xpath://button[text()=' Cancel ']
${sent_password_page}    css:.orangehrm-forgot-password-title
${login}    xpath://h5[text()='Login']

*** Keywords ***

Fill valid username
    Input Text    ${username}    Admin

click forgot password
    Click Element    ${forgot_password}

click reset button
    Click Button    ${reset_password}
    
click cancel button
    Click Button    ${cancel_button}

verify successful password page
    Element Text Should Be    ${sent_password_page}    Reset Password link sent successfully

verify successful cancel page
    Element Text Should Be    ${login}    Login

    

    

    
    