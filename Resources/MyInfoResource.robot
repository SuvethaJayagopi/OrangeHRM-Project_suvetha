*** Settings ***
Documentation     A MyInfo resource file with info features
Library     SeleniumLibrary


*** Variables ***
${myInfo}               xpath://span[text()='My Info']
${personal_details}     xpath://a[text()='Personal Details']
#${personal_details}     Javascript return document.querySelector('a[data-v-84c8a174]')
${contact_details}      xpath://a[text()='Contact Details']
${emergency_contact}    xpath://a[text()='Emergency Contacts']
${dependents}           xpath://a[text()='Dependents']
${immigration}          xpath://a[text()='Immigration']
${qualification}        xpath://a[text()='Qualifications']
${membership}           xpath://a[text()='Memberships']

*** Keywords ***
#To click myInfo button
click myInfo Button
    Click Element    ${myInfo}

#TO click personal detail element
click personal details element
    Click Link    ${personal_details}

#To click contact details element
click contact details element
    Click Link    ${contact_details}

#To click emergency contact element
click emergency contact element
    Click Link    ${emergency_contact}

#To click dependent element
click dependent element
    Click Link    ${dependents}

#To click immigration element
click immigration element
    Click Link    ${immigration}

#To clcik qualification element
click qualification element
    Click Link    ${qualification}

#To click membership element
click membership element
    Click Link    ${membership}







