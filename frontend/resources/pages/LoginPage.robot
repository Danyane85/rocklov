*Settings*
Documentation    Elementos da Página Login


*Variables*
${INPUT_EMAIL}     id=user_email                      
${INPUT_PASS}      css=input[placeholder*="senha"]    
${BUTTON_SIGIN}    text=Entrar
${DIV_ALERT}       .alert 

*Keywords*
Login With Page
    [Arguments]    ${email}    ${pass}

    Fill Text    ${INPUT_EMAIL}     ${email}
    Fill Text    ${INPUT_PASS}      ${pass}
    Click        ${BUTTON_SIGIN}


Alert Text Should Be Page
    [Arguments]    ${expect_message}

    Wait For Elements State    ${DIV_ALERT}    visible    5
    Get Text    ${DIV_ALERT}    equal    ${expect_message}