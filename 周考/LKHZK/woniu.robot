*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
login
    [Template]    login
    18116269662    a123456789    xpath:/html/body/app-root/snail-header/div/div/span/a    安全退出
    18116269662    a123    xpath:/html/body/app-root/div/snail-index/div/div/div/div[4]    查看演示

add_customer
    [Template]    add_customer
    111    13288888888    111
    222    13488888888    222

create_stock
    1次    0222    完成
    2次    0000    完成

query_sell
    [Template]    query_sell
    首页

支出
    [Template]    支出
    111
    222

*** Keywords ***
login
    [Arguments]    ${phone}    ${password}    ${xpath}    ${text}
    Open Browser    https://snailpet.com/index    Firefox
    Sleep    2
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    ${phone}
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    ${password}
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Element Should Contain    ${xpath}    ${text}
    Close Browser

add_customer
    [Arguments]    ${name}    ${phone}    ${petname}
    Open Browser    https://snailpet.com/index    Firefox
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18116269662
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    a123456789
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[2]/div[1]
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[1]/div/div[1]/div[7]/a[1]
    Sleep    3
    Input Text    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[1]/div[1]/div[1]/div/div/input    ${name}
    Input Text    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[1]/div[1]/div[2]/div/div/input    ${phone}
    Input Text    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[2]/div/div[2]/ul/li/div[1]/div[1]/div/div/input    ${petname}
    Click Element    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[2]/div/div/div[3]/div[2]
    Sleep    3
    Element Should Contain    xpath:/html/body/app-root/div/snail-member-main/snail-members/div[1]/div/div[2]/table/tbody/tr/td[4]    ${phone}
    Close Browser

create_stock
    [Arguments]    ${name}    ${comment}    ${comment_text}
    Open Browser    https://snailpet.com/index
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18964380560
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    000000
    sleep    3
    Click Element    xapth:/html/body/app-root/div/snail-menu-nav/div/a[9]/div
    sleep    3
    Click Element    xpath:/html/body/app-root/div/ng-component/snail-sale/div[1]/div[2]/div/a[2]
    sleep    3
    Select All From List    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[1]/div/div/div/ul/li
    Input Text    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[2]/div/input    ${name}
    Input Text    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[3]/div/input    ${comment}
    Click Element    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[3]/div[2]
    Element Should Contain    xpath:/html/body/app-root/div/ng-component/ng-component/div[1]/div[2]/div/div/div/button[1]    ${comment_text}
    Close Browser

query_sell
    [Arguments]    ${text}
    Open Browser    https://snailpet.com/index
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18116269662
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    a123456789
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[5]/div[1]
    Element Should Contain    xpath:/html/body/app-root/div/snail-else-main/snail-sale/div[2]/div/div/ul/li[1]    ${text}
    Close Browser

支出
    [Arguments]    ${text}
    Open Browser    https://snailpet.com/index
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18116269662
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    a123456789
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    \    /html/body/app-root/div/snail-menu-nav/div/a[5]/div[1]
    sleep    3
    Click Element    //*[@id="layui-layer-shade17"]
    Click Element    //*[@id="layui-layer-shade17"]
    Input Text    /html/body/app-root/div/snail-else-main/snail-expend/div[2]/div/div/div[2]/div/div[3]/div[1]/div/div/input    ${text}
    Click Element    /html/body/app-root/div/snail-else-main/snail-expend/div[2]/div/div/div[3]/div[2]
