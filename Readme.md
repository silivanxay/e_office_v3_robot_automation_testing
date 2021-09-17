# This is e-Office v3 testing project.

## Windows

### Here is everything you need for this Robot framework tutorial:

1. An IDE, download PyCharm Community Edition
2. Install the Intellibot Plugin in PyCharm for Robot framework.
        
        Go to File -> Settings -> Plugins -> Search for Intellibot in the plugins marketplace -> Install the plugin -> Restart the IDE.
3. Install Robot framework

        pip install robotframework
4. Specify Selenium as an external test library.

        pip install robotframework-Selenium2Library

5. Download Webdriver and put it to system path.

        For firefox is geckodriver.exe

6. Configure Pycharm IDE to run a Robot Framework test

        Settings -> Tools  -> External Tools -> + -> 
        
            Name: Robot-single-test
            Program: path of robot.exe 
            Arguments: -d results -t $SelectedText$ tests
            Working directory: $ProjectFileDir$
        
        Settings -> Tools  -> External Tools -> + ->
        
            Name: Robot-run-testSuite
            Program: path of robot.exe 
            Arguments: -d $ProjectFileDir$\results $FileName$
            Working directory: $FileDir$
            
7. To use the existing browser
        
        In Cmd
        cd "C:\Program Files\Mozilla Firefox\
        firefox.exe --marionette
        
        Use this key word
        *** Variables ***
        ${BROWSER}  Firefox
        *** Keywords ***
        Init Webdriver
            ${service_args}=     Create List    --connect-existing    --marionette-port=2828    --marionette-host=127.0.0.1
            Create Webdriver     ${BROWSER}     service_args=${service_args}    service_log_path=../Results/geckodriver.log