*** Settings ***
Library  Selenium2Library
Resource  ../TestData/DocumentInfo.robot

*** Variables ***
${document_id_field}  //html/body/app/div/div[3]/div[1]/form/div[2]/div[2]/div[1]/input
${title_field}  //html/body/app/div/div[3]/div[1]/form/div[2]/div[1]/div/textarea
${arrive_date_field}  (//input[contains(@id,'datepicker')])[1]
${document_date_field}  (//input[contains(@id,'datepicker')])[2]
${upload_file_button}  //html/body/app/div/div[3]/div[1]/form/div[4]/div[1]/div[1]/div[2]/label/input
${document_book_select}  //html/body/app/div/div[3]/div[1]/form/div[7]/div[1]/div[1]/div/select
${document_type_select}  //*[@id="selectDocType"]
${reciever_button}  //html/body/app/div/div[3]/nav/div[2]/a[2]

*** Keywords ***
Enter Document Information
    wait until element is visible  ${title_field}
    input text  ${title_field}  ${title_info}
    input text  ${document_id_field}  ${document_id_info}
    input text  ${arrive_date_field}  ${arrive_date_info}
    input text  ${document_date_field}  ${arrive_date_info}
    choose file  ${upload_file_button}  ${upload_file_test}
    select from list by index  ${document_book_select}  ${document_book_index}
    select from list by index  ${document_type_select}  ${document_type_index}