***Settings***
Documentation         Implementação da Rota/ sessions

***Keywords***

POST Login Nectar
    [Arguments]             ${payload}

     ${response}             POST    
     ...                     ${url_nectar}/usuario
     ...                     json=${payload}
     ...                     expected_status=any
    
    [Return]                 ${response}