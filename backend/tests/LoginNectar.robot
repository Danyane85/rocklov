***Settings***
Documentation    Session route tests

Resource    ${EXECDIR}/resources/Base.robot

***Test Cases***

User Login
    [Tags]        Login
    &{payload}    Create Dictionary                 
    ...           login=danyane.carmem@gmail.com
    ...           senha=787945

    ${response}         POST Login Nectar    ${payload}     
    Status Should Be    200                  ${response}

    ${token}    Set Variable    ${response.json()}[token]

     # CONTA A QTD DE CARACTERES
    Length Should Be    ${token}    237
    Log                 ${token}

Incorrect password
    [Tags]    senha

    &{payload}    Create Dictionary                 
    ...           login=danyane.carmem@gmail.com
    ...           senha=D787945

    ${response}         POST Login Nectar    ${payload}     
    Status Should Be    403                  ${response}


    Should Be Equal    ${response.json()}[mensagem]    Senha invalida

User Not Found

    &{payload}    Create Dictionary                   
    ...           login=danyanehj.carmem@gmail.com
    ...           senha=787945

    ${response}         POST Login Nectar    ${payload}     
    Status Should Be    404                  ${response}

    Should Be Equal    ${response.json()}[mensagem]    Usuario não encontrado

Incorrect email
    [Tags]    Incorreto

    &{payload}    Create Dictionary                 
    ...           login=danyane.carmem&gmail.com
    ...           senha=787945

    ${response}         POST Login Nectar    ${payload} 
    Status Should Be    404                  ${response}

    Should Be Equal    ${response.json()}[mensagem]    Usuario não encontrado
# FALTA VALIDAR MELHOR O EMAIL
    #Should Be Equal    ${response.json()}[error]    wrong email

Empty email


    &{payload}    Create Dictionary    
    ...           login=${EMPTY}
    ...           senha=787945

    ${response}         POST Login Nectar    ${payload} 
    Status Should Be    400                  ${response}


    Should Be Equal    ${response.json()}[mensagem]    O login não foi fornecido e é obrigatório    

Empty password

    [Tags]        Senha 
    &{payload}    Create Dictionary                 
    ...           login=danyane.carmem@gmail.com
    ...           senha=${EMPTY}

    ${response}         POST Login Nectar    ${payload} 
    Status Should Be    400                  ${response}


    Should Be Equal    ${response.json()}[mensagem]    A senha não foi fornecida e é obrigatória    

Whithout email
    [Tags]    SemLogin

    &{payload}    Create Dictionary    
    ...           senha=787945

    ${response}         POST Login Nectar    ${payload} 
    Status Should Be    400                  ${response}

    Should Be Equal    ${response.json()}[mensagem]    O login não foi fornecido e é obrigatório

Whithout password


    &{payload}    Create Dictionary                 
    ...           login=danyane.carmem@gmail.com


    ${response}         POST Login Nectar    ${payload} 
    Status Should Be    400                  ${response}

    Should Be Equal    ${response.json()}[mensagem]    A senha não foi fornecida e é obrigatória    
  




