*Settings*
Documentation       Login test suite

Resource           ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
User Login
    [Tags]      smoke
    ${user}                 Factory User    login
    
    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In        ${user} 

Incorrect Pass
    [Tags]           inv_pass     

    ${user}          Create Dictionary       email=gama.william@gmail.com        password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

User not found
    [Tags]           user_404     

    ${user}          Create Dictionary       email=gama.william@404.net        password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]           inv_email     

    ${user}          Create Dictionary       email=gama.william.com.br        password=abc123

    Go To Login Page
    Fill Credentials  ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]      temp

    ${user}            Create Dictionary       email=${EMPTY}      password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Alert Span Should Be  E-mail obrigatório

Required Pass
    [Tags]      temp

    ${user}            Create Dictionary       email=gama.william@gmail.com      password=${EMPTY}

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Alert Span Should Be  Senha obrigatória

Required Fields
    [Tags]      temp

    ${expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    ${user}            Create Dictionary       email=${EMPTY}      password=${EMPTY}

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be  ${expected_alerts}  

# Desafio 1 do módulo PRO

# Automatizar 3 novos casos de testes: Email obrigatório, Senha obrigatória, Campos obrigatórios
# Entrega: no Github