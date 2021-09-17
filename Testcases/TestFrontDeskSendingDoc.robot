*** Settings ***
Library  Selenium2Library
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LoginPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LandingPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Common.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Navigation.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/CreateDocumentPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/MainPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/SelectRecipient.robot
Resource  ../Resources/PageObjects/TestData/LoginCredential.robot

Test Setup  Resume brower and go to site
Test Teardown  Logout

*** Test Cases ***
Test Sending Doc from Front Desk
    [tags]  Smoke
    Given Enter number or click Continue on Landing page  ${UsernameFD}
    And Login  ${UsernameFD}  ${PasswordFD}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    And Create new Document
    When Enter Document Information
    Then Select and Send Recipient  ${DG_user_checkbox}





