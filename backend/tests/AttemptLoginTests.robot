***Settings***
Documentation    Session Attemp Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Login

***Test Cases***        json_file                 status_code           message

Incorrect password     incorrect_password.json    401                 Unauthorized                  
User Not Found         user_not_found.json        401                 Unauthorized     
Incorrect email        incorrect_email.json       412                 wrong email   
Empty email            empy_email.json            412                 required email        
Empty password         empy_password.json         412                 required password        
Whithout email         whithout_email.json        412                 required email    
Whithout password      whithout_password.json     412                 required password
     
 
    
***Keywords***
# encapsulados  TEST TEMPLATES - Data-driven testing
Attempt Login
    [Arguments]    ${json_file}    ${status_code}     ${message}

    ${payload}          Get Json          sessions   ${json_file}
    ${response}         POST Login        ${payload} 
    Status Should Be    ${status_code}    ${response}

    Should Be Equal    ${message}          ${response.json()}[error]    