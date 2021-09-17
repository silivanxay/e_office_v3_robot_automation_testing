*** Settings ***
Library  Selenium2Library
Resource  ../TestData/LoginCredential.robot

*** Variables ***
${LoginHeaderText}  LAO KYC
${UserField}  //*[@id="Username"]
${PasswordField}  //*[@id="Password"]
${LoginButton}  //*[@id="login"]


*** Keywords ***
Login
    [Arguments]  ${PhoneNum}  ${OTP}
    Wait for page to be ready
    Run Keyword And Ignore Error  input text  ${UserField}  ${PhoneNum}
    input text  ${PasswordField}  ${OTP}
    click button  ${LoginButton}

Wait for page to be ready
    wait until page contains  ${LoginHeaderText}  timeout=30