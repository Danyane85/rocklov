*Settings*
Documentation    Aruivo principal do projeto

Library    Browser
Library    Collections
Library    libs/mongo.py
Library    OperatingSystem

Resource    actions/LoginActions.robot
Resource    pages/LoginPage.robot
Resource    pages/DashPage.robot
Resource    Helpers.robot
Resource    actions/EquipoActions.robot
Resource    Services.robot
Resource    actions/Components.robot

*Keywords*
Start Session
     New Browser          chromium                                  headless=${headless}     slowMo=00:00:00.05
#    New Page             https://rocklov-dany-web.herokuapp.com
     New Page             about:blank 
     Set Viewport Size    1300                                      730
     Go To                https://rocklov-dany-web.herokuapp.com

Finish Test
    Take Screenshot

Take Screenshot And Logout
    Take Screenshot
    Do Logout 

Login Session
    [Arguments]    ${email}    ${password}

    Start Session    
    Login With       ${email}    ${password}

Take Screenshot And Go Back
    Take Screenshot 
    Go Back 
