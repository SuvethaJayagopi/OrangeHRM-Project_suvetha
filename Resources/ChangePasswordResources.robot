*** Settings ***
Documentation      A resource file with  change password features
Library            SeleniumLibrary

*** Variables ***
${user}                    xpath://p[@class="oxd-userdropdown-name"]
${change_password}         xpath:(//a[@class="oxd-userdropdown-link"])[3]
${logout}                  xpath:(//a[@class="oxd-userdropdown-link"])[4]
${current_password_field}  xpath:(//input[@type="password"])[1]
${new_password_field}      xpath:(//input[@type="password"])[2]
${confirm_password_field}  xpath:(//input[@type="password"])[3]
${submit_button}           xpath://button[@type='submit']
${updated}                 xpath://p[text()='Successfully Saved']
${error_message}           xpath://p[text()='Current Password is Incorrect']
${alert}                   xpath://span[text()='Passwords do not match']

*** Keywords ***
#To click user login icon
click user icon
    Click Element    ${user}

#To change the password
click change password
    Click Element    ${change_password}

#To click logout
click logout
    Click Element    ${logout}

# Fill Change Password Form with Provided Details
Fill the change password
    [Arguments]    ${current_password}    ${new_password}    ${confirm_password}
    Input Password    ${current_password_field}    ${current_password}
    Input Password    ${new_password_field}    ${new_password}
    Input Password    ${confirm_password_field}    ${confirm_password}
    Click Button    ${submit_button}

#To Verify the successful update message
verify successful update message
    Should Contain    ${updated}    Successfully Saved   

#To verify the error message for incorrect message
Verify error message for incorrect current message
    Should Contain    ${error_message}    Current Password is Incorrect  

#To verify the error message for incorrect password
verify error message for incorrect passwords
    Element Text Should Be    ${alert}    Passwords do not match      
