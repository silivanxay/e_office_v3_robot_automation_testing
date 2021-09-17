*** Settings ***
Library  Selenium2Library
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LoginPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LandingPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Common.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Navigation.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/CreateDocumentPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/ReadDocumentPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/MainPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/SelectRecipient.robot

Resource  ../Resources/PageObjects/TestData/LoginCredential.robot

*** Test Cases ***
Test Sending Doc from Front Desk
    [tags]  Smoke
    sleep  3s
    Resume brower and go to site
    Given Enter number or click Continue on Landing page  ${UsernameFD}
    And Login  ${UsernameFD}  ${PasswordFD}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    And Create new Document
    When Enter Document Information
    Then Select and Send Recipient  ${DG_user_checkbox}
    Logout

Test Sending Doc from DG
    [tags]  Smoke
    Go to site
    Given Enter number or click Continue on Landing page  ${UsernameDG}
    And Login  ${UsernameDG}  ${PasswordDG}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    When Process Document
    Then Select and Send Recipient  ${DD_user_checkbox}
    Logout

Test Sending Doc from DD
    [tags]  Smoke
    Go to site
    Given Enter number or click Continue on Landing page  ${UsernameDG}
    And Login  ${UsernameDD}  ${PasswordDD}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    When Process Document
    Then Select and Send Recipient  ${Staff_user_checkbox}
    Logout

Test Ending Doc from Staff
    [tags]  Smoke
    Go to site
    Given Enter number or click Continue on Landing page  ${UsernameStaff}
    And Login  ${UsernameStaff}  ${PasswordStaff}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    When End Document
    Then Put reason to end document
    Logout
