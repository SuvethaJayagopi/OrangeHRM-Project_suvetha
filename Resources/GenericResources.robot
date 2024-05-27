*** Settings ***
Documentation    A resource with resuable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser_name}    Chrome

*** Keywords ***

Open the browser with url
     Create Webdriver   ${browser_name}
     Go to       ${url}
     Maximize Browser Window
     Set Selenium Implicit Wait     5


Close Browser Session
      Close Browser