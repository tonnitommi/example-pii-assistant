*** Settings ***
Documentation       Ask for a text in Assistant and anonymize
...                 using Microsoft Presidio.

Library             OperatingSystem
Library             RPA.Assistant
Library             RPA.Desktop
Library             piiclean    WITH NAME    PiiCheck


*** Tasks ***
Main
    [Documentation]
    ...    The Main task running the Assistant
    ...    Configure your window behaviour here

    Display Main Menu
    ${result}=    RPA.Assistant.Run Dialog
    ...    title=PII anonymizateur example
    ...    on_top=True
    ...    height=450


*** Keywords ***
Display Main Menu
    [Documentation]
    ...    Main UI of the bot. Just a header, input and button.
    Clear Dialog
    Add Heading    PII detector
    Add Text Input    name=text_input    label=Write some text here    minimum_rows=2
    Add Next Ui Button    Submit     Test For Pii

Test For Pii
    [Documentation]
    ...    Runs the PII anonymization and updates the dialog view.
    [Arguments]   ${form}

    ${anonymized}=    PiiCheck.Anonymize   ${form}[text_input]

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

