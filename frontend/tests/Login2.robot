*Settings*
Documentation    Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Setup       Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

    Login With Page                 rogers@gmail.com     1234
    User Should Be Logged In Page

Incorrect user_password
    [TagS]    inc_pass

    Login With Page             rogers@gmail.com                 1234fff
    Alert Text Should Be Page    Usuário e/ou senha inválidos.

User not found
    [TagS]    inc_pass

    Login With Page             rogers55@gmail.com               1234
    Alert Text Should Be Page    Usuário e/ou senha inválidos.

Empty Email
    [TagS]    inc_pass

    Login With Page              ${EMPTY}                           1234
    Alert Text Should Be Page   Oops. Informe um email válido! 
    
Empty Senha
    [TagS]    inc_pass

    Login With Page              rogers@gmail.com               ${EMPTY}
    Alert Text Should Be Page    Oops. Informe sua senha secreta!   
    
Incorrect Email
    [TagS]    inc_pass

    Login With Page              rogers&gmail.com               1234
    Alert Text Should Be Page    Oops. Informe um email válido!  

    
