*** Settings ***
Documentation     A MyInfo resource file with info features
Library     SeleniumLibrary


*** Variables ***
${myInfo}    xpath://span[text()='My Info']
${personal_details}     xpath://a[text()='Personal Details']
${contact_details}    xpath://a[text()='Contact Details']
${emergency_contact}    xpath://a[text()='Emergency Contacts']
${dependents}    xpath://a[text()='Dependents']
${immigration}    xpath://a[text()='Immigration']
${qualification}    xpath://a[text()='Qualifications']
${membership}    xpath://a[text()='Memberships']

*** Keywords ***
click myInfo Button
    Click Element    ${myInfo}

click personal details element
    Click Link    ${personal_details}

click contact details element
    Click Link    ${contact_details}

click emergency contact element
    Click Link    ${emergency_contact}

click dependent element
    Click Link    ${dependents}

click immigration element
    Click Link    ${immigration}

click qualification element
    Click Link    ${qualification}

click membership element
    Click Link    ${membership}







