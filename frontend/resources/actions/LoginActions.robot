*Settings*
Documentation    Login Actions

*Keywords*
Login With
    [Arguments]    ${email}    ${pass}

    Fill Text    id=user_email                      ${email}
    Fill Text    css=input[placeholder*="senha"]    ${pass}
    Click        text=Entrar

Do Logout
    Click    css=.do-Logout

User Should Be Logged In
    Wait For Elements State    css=.dashboard    visible    5    Login Error

