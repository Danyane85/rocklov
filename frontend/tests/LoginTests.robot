*Settings*
Documentation    Login Tests

Resource         ${EXECDIR}/resources/Base.robot
# executa e feca para cada testes
#Test Setup       Start Session
Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

  Login With             rogers@gmail.com     1234
  User Should Be Logged In
  # Gancho de testes ignora o test teardown
  [Teardown]   Take Screenshot And Logout 

Incorrect user_password
   [TagS]        inc_pass

   Login With                rogers@gmail.com       B1234
   Alert Text Should Be      Usuário e/ou senha inválidos.      
  
User not found
   [TagS]        inc_pass

    Login With                rogernaoex@gmail.com       B1234
    Alert Text Should Be      Usuário e/ou senha inválidos. 
   
Empty Email
   [TagS]        inc_pass

   Login With                 ${EMPTY}      1234
   Alert Text Should Be       Oops. Informe um email válido!
    
Empty Senha
   [TagS]        inc_pass

   Login With                rogers@gmail.com       ${EMPTY}
   Alert Text Should Be      Oops. Informe sua senha secreta!  
    
Incorrect Email
   [TagS]        inc_pass

   Login With                rogers&gmail.com       1234
   Alert Text Should Be      Oops. Informe um email válido!

     


