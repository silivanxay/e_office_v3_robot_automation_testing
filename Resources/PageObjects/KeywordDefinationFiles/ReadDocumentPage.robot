*** Settings ***
Library  Selenium2Library
Resource  ../TestData/DocumentInfo.robot

*** Variables ***
${document_title_button}  //span[text() = '${title_info}']
${ProcessButton}  //button[text() = 'ດຳເນີນການ']
${EndingButton}  //button[text() = 'ສິ້ນສຸດ']
${EndingDocumentField}  //html/body/app/div/div[3]/div[1]/div[11]/div/div/div[2]/section/form/div/textarea
${SaveEndingButton}  //a[text() = 'ບັນທຶກ']

*** Keywords ***
Process Document
    Click Incomming Document
    Click Process Document

Click Incomming Document
    wait until page contains element  ${document_title_button}  timeout=30
    click element  ${document_title_button}

Click Process Document
    wait until page contains element  ${ProcessButton}  timeout=10
    click button  ${ProcessButton}

End Document
    Click Incomming Document
    Click Ending Document

Click Ending Document
    wait until page contains element  ${EndingButton}  timeout=10
    click button   ${EndingButton}


Put reason to end document
    wait until page contains element  ${EndingDocumentField}  timeout=10
    input text  ${EndingDocumentField}  ${sucessfulEndingComment}
    sleep  3s
    Click element  ${SaveEndingButton}
    sleep  3s
    wait until page does not contain  ${sucessfulEnding}  timeout=20
