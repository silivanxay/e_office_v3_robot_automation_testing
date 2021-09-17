*** Settings ***
Library  Selenium2Library

*** Variables ***
${incoming_button}  //html/body/app/div/div[2]/div[2]/ul/li[3]/a
${inbox_button}  //html/body/app/div/div[2]/div[2]/ul/li[3]/ul/li[1]/a/span
${new_document_button}  //html/body/app/div/div[3]/div/div/section/nav/div/div[2]/div[1]/button

*** Keywords ***
Navigate to IncommingDocument
    click element  ${incoming_button}
    click element  ${inbox_button}

Create new Document
    wait until element is visible  ${new_document_button}
    click button  ${new_document_button}