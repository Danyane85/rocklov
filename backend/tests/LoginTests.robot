***Settings***
Documentation    Session route tests

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


Incorrect password
    [Tags]    ta

    [Template]                 Attempt Login
    incorrect_password.json    401              Unauthorized

User Not Found
    [Template]             Attempt Login
    user_not_found.json    401              Unauthorized

Incorrect email
     [Template]     Attempt Login
     incorrect_email.json    412    wrong email

    
Empty email
     [Template]     Attempt Login
     empy_email.json    412    required email

    
Empty password
     [Template]     Attempt Login
     empy_password.json    412    required password
      

Whithout email
     [Template]     Attempt Login
     whithout_email.json    412    required email


Whithout password
     [Template]     Attempt Login
     whithout_password.json    412    required password

    
***Keywords***
# encapsulados  TEST TEMPLATES - Data-driven testing
Attempt Login
    [Arguments]    ${json_file}    ${status_code}    ${message}

    ${payload}          Get Json          sessions   ${json_file}
    ${response}         POST Login        ${payload} 
    Status Should Be    ${status_code}    ${response}

    Should Be Equal    ${message}    ${response.json()}[error]    