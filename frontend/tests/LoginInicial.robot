*Settings*
Documentation    Login Tests

Resource         ${EXECDIR}/resources/Base.robot
Test Setup       Start Session
Test Teardown    Finish Test

*Test Cases*
User Login


    Fill Text    id=user_email                      rogers@gmail.com
    #Fill Text     id=user_password     1234
    #Fill Text     css=input[placeholder="Sua senha secreta"]      1234
    Fill Text    css=input[placeholder*="senha"]    1234
    Click        text=Entrar

    Wait For Elements State    css=.dashboard    visible    5    Login Error
  #temporário

Incorrect user_password
   [TagS]        inc_pass

    Fill Text    id=user_email                      rogers@gmail.com
    Fill Text    css=input[placeholder*="senha"]    12345555
    Click        text=Entrar

# Para garantir a exibição da validação
    Wait For Elements State     css=.alert    visible    5

    Get Text    css=.alert    equal    Usuário e/ou senha inválidos.

User not found
   [TagS]        inc_pass

    Fill Text    id=user_email                      rogers55@gmail.com
    Fill Text    css=input[placeholder*="senha"]    12345555
    Click        text=Entrar

# Para garantir a exibição da validação
    Wait For Elements State     css=.alert    visible    5

    Get Text    css=.alert    equal    Usuário e/ou senha inválidos.    

Empty Email
   [TagS]        inc_pass

    Fill Text    id=user_email                      ${EMPTY}
    Fill Text    css=input[placeholder*="senha"]    12345555
    Click        text=Entrar

# Para garantir a exibição da validação
    Wait For Elements State     css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe um email válido!  

Empty Senha
   [TagS]        inc_pass

    Fill Text    id=user_email                       rogers55@gmail.com 
    Fill Text    css=input[placeholder*="senha"]     ${EMPTY}
    Click        text=Entrar

# Para garantir a exibição da validação
    Wait For Elements State     css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe sua senha secreta!  

Incorrect Email
   [TagS]        inc_pass

    Fill Text    id=user_email                       rogers55&gmail.com 
    Fill Text    css=input[placeholder*="senha"]     1234
    Click        text=Entrar

# Para garantir a exibição da validação
    Wait For Elements State     css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe um email válido!      


