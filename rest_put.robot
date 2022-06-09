*** Settings ***
Library    REST    https://jsonplaceholder.typicode.com

*** Test Cases ***
PUT
    PUT    /users/2    { "isBoolean": true, "isNull": null, "company": { "name":"" ,"code":0.09 } }    #/user/2 ->path api 
    Boolean    $.isBoolean    true
    Null    $.isNull
    String    $..name    ${EMPTY}    # name ค่าว่าง?
    Number    $..code    0.09
    Missing    $.key1    #fails if property key1 exists   key1 ไม่มี?
    Output    response body
