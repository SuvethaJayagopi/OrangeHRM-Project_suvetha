*** Settings ***
Documentation        test search to dashboard page
Library    SeleniumLibrary
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Task Setup    Open the browser with url
Test Teardown    close browser session

*** Variables ***
${username}    Admin   
${password}    admin123
${search}    xpath://input[@placeholder="Search"]
${Recruitment}    xpath://a[@href="/web/index.php/recruitment/viewRecruitmentModule"]
${empty}    xpath://div[@class="oxd-main-menu"]


*** Test Cases ***
#To validate valid search credentials
validate valid search credentials
    [Tags]    Smoke
    LoginResources.Fill the login form    ${username}    ${password}
    Set Selenium Implicit Wait     5
    LoginResources.verify the valid credentials
    Input Text    ${search}    Recruitment
    Element Text Should Be    ${Recruitment}    Recruitment 
    
    


