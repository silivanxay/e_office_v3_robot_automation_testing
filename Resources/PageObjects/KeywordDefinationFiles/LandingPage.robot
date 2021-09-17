*** Settings ***
Library  Selenium2Library

*** Variables ***
${ContinueButton}  //html/body/app/div[2]/div[1]/div[2]/div/span/button
${PhoneNumField}  //html/body/app/div[2]/div/div/div[2]/div/div/form/div/input
${loginSystemButton}  //html/body/app/div[2]/div/div/div[2]/div/div/div/button[1]


*** Keywords ***
Enter number or click Continue on Landing page
    [Arguments]  ${PhoneNum}
    If Click button appeared then click continue
    if Phone Number field appeared then enter phone number  ${PhoneNum}


Wait Click button to finsih loaded
    wait until page contains element  ${ContinueButton}  timeout=10   error=false

If Click button appeared then click continue
    ${result}   ${condition}=  Run Keyword And Ignore Error  Wait Click button to finsih loaded
    run keyword if   '${result}'=='PASS'  click button  ${ContinueButton}

Wait Phone Number field appeared to finsih loaded
    wait until page contains element  ${PhoneNumField}  timeout=5  error=false

if Phone Number field appeared then enter phone number
    [Arguments]  ${PhoneNum}
    ${result}   ${condition}=  Run Keyword And Ignore Error  Wait Phone Number field appeared to finsih loaded
    run keyword if   '${result}'=='PASS'  Enter phone number  ${PhoneNum}

Enter phone number
    [Arguments]  ${PhoneNum}
    input text  ${PhoneNumField}  ${PhoneNum}
    double click button login

double click button login
    click button  ${loginSystemButton}
    click button  ${loginSystemButton}