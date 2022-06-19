***Settings***
Documentation    Aqui teremos as KWS de Ajuda

Library    OperatingSystem

***Keywords***

Get Equipo
     [Arguments]    ${equipo}    

     ${fixture}    Get File    ${EXECDIR}/resources/fixtures/equipos.json
     ${json}       Evaluate    json.loads($fixture)                          json

     ${select_equipo}    Set Variable    ${json}[${equipo}] 

     [Return]    ${select_equipo}    

Get Token From LS
# Pega o tockem no logalstorage do navegador
     ${token}    LocalStorage Get Item    user_token    

     [Return]    ${token}

Set Token From LS 
# Variável globlal - outra forma de trabalhar
     ${TOKEN}     LocalStorage Get Item    user_token  

     Set Test Variable    ${TOKEN}

Set token Suite From LS   

    ${TOKEN}     LocalStorage Get Item    user_token  

     Set Suite Variable    ${TOKEN}  