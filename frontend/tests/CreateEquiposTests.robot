*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot
# vai testar por seção
#Test Setup    Start Session
# com gancho vai fazer o logim aqui ....
Suite Setup      Login Session    ${EMAIL}    ${PASS}
Test Teardown    Finish Test

*Variables*
${EMAIL}    remove@gmail.com
${PASS}     1234

*Test Cases*
Add New Equipos

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Log To Console    ${equipo}

    #Login With                  rogers@gmail.com    1234
    Go To Equipo Form
    Fill Equipo Form            ${equipo}
    Submit Equipo Form          
    Equipo Should Be Visible    ${equipo}[name]

    #Sleep    5

Duplicated Equipo
    [Tags]    Duplo

# Dado que o equipo fender já foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    ${token}               Get Token Service    ${EMAIL}    ${PASS}
    POST Equipo Service    ${equipo}            ${token}

# Quando façõ cadastro desse equipo
    #Login With            rogers@gmail.com    1234
    Go To Equipo Form
    Fill Equipo Form      ${equipo}
    Submit Equipo Form    

# Então devo ver a mensagem de alerta "Anúncio já existe" :/"
    Alert Text Should Be    Anúncio já existe :/
    # pertence a biblioteca
    [Teardown]              Take Screenshot And Go Back

# Campos obrigatórios
Required Fields
    [Tags]                required
 # variável de lista
    @{expected_alerts}    Create List     Adicione uma foto no seu anúncio.    Informe a descrição do anúncio.    Escolha uma categoria.    Informe o valor da diária.
    @{got_alerts}         Create List 

    Go To Equipo Form 
    Submit Equipo Form


    FOR               ${position}                     IN RANGE       1    5
    ${text}           Get Text For Required Alerts    ${position}
    Append To List    ${got_alerts}                   ${text}
    END

    Log    ${got_alerts}

    Lists Should Be Equal    ${got_alerts}    ${expected_alerts}

