***Settings***
Documentation    User Login Test

Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***

User Login
    [Tags]    Js

    ${payload}     Get Json      sessions   user_login.json    
    ${response}    POST Login    ${payload}         

    Status Should Be    200    ${response}

    ${token}    Set Variable    ${response.json()}[user_token]

     # CONTA A QTD DE CARACTERES
    Length Should Be    ${token}    24


