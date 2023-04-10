*** Settings ***
Documentation       Ask for a text in Assistant and check if it contains
...                 PII data using MS Presidio.

Library             OperatingSystem
Library             RPA.Assistant
Library             piiclean    WITH NAME    PiiCheck


*** Tasks ***
Main
    [Documentation]
    ...    The Main task running the Assistant
    ...    Configure your window behaviour here

    Display Main Menu
    ${result}=    RPA.Assistant.Run Dialog
    ...    title=Assistant Template
    ...    on_top=True
    ...    height=450


*** Keywords ***
Display Main Menu
    [Documentation]
    ...    Main UI of the bot. We use the "Back To Main Menu" keyword
    ...    with buttons to make other views return here.
    Clear Dialog
    Add Heading    PII detector
    Add Text Input    name=text_input    label=Write some text here
    Add Next Ui Button    Submit     Test For Pii

Test For Pii
    [Arguments]   ${form}

    ${analysis}=    PiiCheck.Predict   ${form}[text_input]

    Log To Console    ${analysis}

    ${anonymized}=    PiiCheck.Anonymize   ${form}[text_input]

    Log To Console    ${anonymized}

    Clear Dialog
    Add Heading    Result
    Add text    ${anonymized}
    Add Button    Copy to clipboard    Set clipboard value   ${anonymized}
    Add Next Ui Button    Back    Back To Main Menu
    Refresh Dialog

Back To Main Menu
    [Documentation]
    ...    This keyword handles the results of the form whenever the "Back" button
    ...    is used, and then we return to the main menu
    [Arguments]    ${results}={}

    Display Main Menu
    Refresh Dialog

