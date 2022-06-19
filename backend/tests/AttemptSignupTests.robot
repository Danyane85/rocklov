***Settings***
Documentation    Session Attemp Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Template    Attempt Signup

* Test Cases *       scenario          message
Empty Name           empty_name        required name
Empty Email          empty_email        required email
Empty Password       empty_pass         required password
Whithout Name        Whithout_name     required name
Whithout Email       Whithout_email    required email
Whithout Password    Whithout_pass     required password
Wrong Email          wrong_email       wrong email

* Keywords *
Attempt Signup
    [Arguments]      ${scenario}       ${message}

    ${attempt}          Get Json               signup    attempt.json    
    
    ${response}         POST User     ${attempt['${scenario}']}
    Status Should Be    412           ${response} 
    Should Be Equal     ${message}    ${response.json()}[error]    