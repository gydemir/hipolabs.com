*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close All Browsers
    
*** Test Cases ***
Scenario: user should search "hipo labs" on google tr and apply a job on hipolabs.com
    [Tags]  HipoExercise
    GIVEN open google TR
    WHEN verify page language is TR
    AND search 'Hipo Labs'
    AND find hipolabs.com in results
    AND click on hipolabs.com
    AND navigate to TEAM menu item
    AND navigate to APPLY FOR JOBS
    THEN verify APPLY NOW button 

*** Keywords ***
open google TR
    Open Browser    http://www.google.com.tr

verify page language is TR
    ${language}=        Get Element Attribute       css=html     lang
    Should Be Equal As Strings  ${language}  tr

search 'Hipo Labs'
    Wait Until Element Is Visible  css=input[name=q]
    Input Text      css=input[name=q]  Hipo Labs
    Submit Form

find hipolabs.com in results
    Wait Until Element Is Visible  css=a[href*='hipolabs.com']

click on hipolabs.com 
    Click Element      xpath:(.//cite[contains(., 'hipolabs.com')])[1]

navigate to TEAM menu item
    Wait Until Page Contains Element        menuMaximized
    Wait Until Element Is Enabled  menuMaximizedButtonTeam
    Click Element      menuMaximizedButtonTeam

navigate to APPLY FOR JOBS
    Wait Until Page Contains Element        pageTeamApplynowLabel
    Click Element      pageTeamApplynowButton

verify APPLY NOW button
    Wait Until Page Contains    APPLY NOW
    page should contain    APPLY NOW 
    Capture Page Screenshot