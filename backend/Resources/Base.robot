***Settings***

Library            RequestsLibrary
Library            libs/mongo.py

Resource           routes/Helpers.robot
Resource           routes/Sessions.robot 
Resource           routes/Signup.robot 
Resource           routes/SessionsNectar.robot   

***Variables***
${base_url}        https://rocklov-dany-api.herokuapp.com

${url_nectar}      http://app.nectarcrm.com.br/crm/api/1