*** Settings ***
Library  Selenium2Library
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LoginPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/LandingPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Common.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/Navigation.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/ReadDocumentPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/MainPage.robot
Resource  ../Resources/PageObjects/KeywordDefinationFiles/SelectRecipient.robot
Resource  ../Resources/PageObjects/TestData/LoginCredential.robot

Test Setup  Resume brower and go to site
Test Teardown  Logout

*** Test Cases ***
Test Sending Doc from DD
    [tags]  Smoke
    Given Enter number or click Continue on Landing page  ${UsernameDG}
    And Login  ${UsernameDD}  ${PasswordDD}
    And Wait main page to finsih loaded
    And Navigate to IncommingDocument
    When Process Document
    Then Select and Send Recipient  ${Staff_user_checkbox}






