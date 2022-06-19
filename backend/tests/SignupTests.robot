* Settings *
Documentation            Signup Tests

Library          FakerLibrary 

Resource         ${EXECDIR}/resources/Base.robot

* Test Cases *
Add New User com Facker
    
     #${payload}         Get Json     signup     new_user.json
    ${email}      FakerLibrary.Free Email

    &{payload}    Create Dictionary
     ...          name= Tony Stark
     ...          email=${email}
     ...          password=pwd123

     ${response}         POST User    ${payload}
     Status Should Be    200          ${response}  


Add New User com mongo
     [Tags]    mongo   
     ${payload}         Get Json     signup     new_user.json   
     Remove User By Email       ${payload['email']}
    
     ${response}         POST User    ${payload}
     Status Should Be    200          ${response}  

Duplicated Email
     [Tags]    Duplicated   

     ${payload}         Get Json     signup     duplicated.json   

     POST User    ${payload}
        
     ${response}         POST User    ${payload}
     Status Should Be    409          ${response}  