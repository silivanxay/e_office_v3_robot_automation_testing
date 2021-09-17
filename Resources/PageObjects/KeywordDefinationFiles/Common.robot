*** Settings ***
Library  Selenium2Library
Resource  ../TestData/Common.robot

*** Variables ***
${user_info_button}  //*[@id="UserMenu"]
${log_out_button}  //a[@class='dropdown-item' and text() = 'ອອກຈາກລະບົບ']
${BROWSER}  Firefox


*** Keywords ***
Resume brower and go to site
    Init Webdriver and resume browser
    Go to site

Go to site
    Go To   ${siteURL}

Init Webdriver and resume browser
     ${service_args}=     Create List    --connect-existing    --marionette-port=2828    --marionette-host=127.0.0.1
     Create Webdriver     ${BROWSER}     service_args=${service_args}    service_log_path=${{os.path.devnull}}


Logout
    wait until element is visible  ${user_info_button}  timeout=20
    click element  ${user_info_button}
    wait until element is visible  ${log_out_button}
    click element   ${log_out_button}