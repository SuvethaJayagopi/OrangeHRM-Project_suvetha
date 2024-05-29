*** Settings ***
Documentation     A resource file with forgot password features
Library           SeleniumLibrary

*** Variables ***
${username}              xpath://input[@name="username"]
${forgot_password}       xpath://p[text()='Forgot your password? ']
${reset_password}        xpath://button[text()=' Reset Password ']
${cancel_button}         xpath://button[text()=' Cancel ']
${sent_password_page}    css:.orangehrm-forgot-password-title
${login}                 xpath://h5[text()='Login']

*** Keywords ***
#Fill the username in Forgot password page
Fill valid username
    Input Text    ${username}    Admin

#To Click forgot password
click forgot password
    Click Element    ${forgot_password}

#To click reset button
click reset button
    Click Button    ${reset_password}
    
#To click Cancel button
click cancel button
    Click Button    ${cancel_button}

#To verify successful password
verify successful password page
    Element Text Should Be    ${sent_password_page}    Reset Password link sent successfully

#To verify successful cancel
verify successful cancel page
    Element Text Should Be    ${login}    Login

    

    

    
    