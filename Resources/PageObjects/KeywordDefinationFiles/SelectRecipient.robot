*** Settings ***
Library  Selenium2Library
Resource  ../TestData/DocumentInfo.robot


*** Variables ***
${reciever_button}  //html/body/app/div/div[3]/nav/div[2]/a[2]
${DG_user_checkbox}  //html/body/app/div/div[3]/div[1]/form/div[8]/div/div/div[2]/section/div/div/div[4]/div[2]/button/span
${DD_user_checkbox}  //html/body/app/div/div[3]/div[1]/form/div[6]/div/div/div[2]/section/div/div/div[8]/div[2]/button/span
${Staff_user_checkbox}  //html/body/app/div/div[3]/div[1]/form/div[6]/div/div/div[2]/section/div/div/div[17]/div[2]/button/span
${comment_box}  //div[contains(@id,'value_rte-edit-view')]
${send_button}  //button[text() = 'ສົ່ງອອກ']
*** Keywords ***
Select and Send Recipient
     [Arguments]  ${user}
     wait until page contains element  ${reciever_button}  timeout=20
     sleep  5s
     Double click reciever button
     wait until page contains element  ${user}  timeout=20
     click element  ${user}
     wait until page contains element  ${comment_box}
     input text  ${comment_box}  ${document_comment}
     click button  ${send_button}
     wait until page contains  ${sucessfulSent}  timeout=10
     wait until page does not contain  ${sucessfulSent}  timeout=10

Double click reciever button
    click element  ${reciever_button}
    Run Keyword And Ignore Error  click element  ${reciever_button}