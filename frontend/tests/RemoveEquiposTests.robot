*Settings*
Documentation    Remove Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot
# vai testar por seção
#Test Setup    Start Session
# com gancho vai fazer o logim aqui ....
Suite Setup      Run Keywords    Login Session               ${EMAIL}   ${PASS}
...              AND             Set token Suite From LS 
Test Teardown    Finish Test

*Variables*
${EMAIL}    remove@gmail.com
${PASS}     1234

*Test Cases*

Remove Equipo
    [Tags]    baixo
# Dado que o equipo sax é um eqp. indesejado
     ${equipo}              Get Equipo            safoxone
     ${token}               Get Token Service    ${EMAIL}    ${PASS}
     Remove Equipo          ${equipo}[name]
     POST Equipo Service    ${equipo}             ${TOKEN}
     Reload 

# Quando eu solicito a remoção

     Request Removal    ${equipo}[name]

# E confirmo a exclusão
#Versão simples pode não encontrar o elemento correto
   # Click     text= Sim

     confirm Removal
# Então esse equipo não deve ser exibido na lista

     Equipo Not Should Be Visible    ${equipo}[name]

Removal Give Up
    [Tags]    Remo
# Dado que o equipo sax é um eqp. indesejado
     ${equipo}              Get Equipo            conga
     ${token}               Get Token From LS 
     Remove Equipo          ${equipo}[name]
     POST Equipo Service    ${equipo}             ${token}
     Reload 
 
     Request Removal    ${equipo}[name]
# Desisto da remoção
     Cancel Removal
# Equipamento deve permanecer na lista
     Equipo Should Be Visible    ${equipo}[name]
