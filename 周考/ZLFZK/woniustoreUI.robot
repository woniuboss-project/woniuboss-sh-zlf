*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
logindata
    [Template]    login
    18964380560    000000    xpath:/html/body/app-root/snail-header/div/div/span/a    安全退出
    18964380561    0000    xpath:/html/body/app-root/div/snail-index/div/div/div/div[4]    查看演示

customer_data
    [Template]    add_customer
    阿奴5    13088768594    狗子
    发哈0    13154669045    笨笨

add_goods_data
    [Template]    add_goods
    11111111    闹呢    20    30
    22222222    安华福爱    11    34

query_sales
    [Template]    query_sell
    实际销售： -元

create_stock
    [Template]    create_stock
    第一次    0211    完成
    第二次    0000    完成

*** Keywords ***
login
    [Arguments]    ${phone}    ${password}    ${xpath}    ${text}
    Open Browser    https://snailpet.com/index    Firefox
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    ${phone}
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    ${password}
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    10
    Element Should Contain    ${xpath}    ${text}
    Close Browser

add_customer
    [Arguments]    ${name}    ${phone}    ${petname}
    Open Browser    https://snailpet.com/index    Firefox
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18964380560
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    000000
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

add_goods
    [Arguments]    ${barcode}    ${goodname}    ${inprice}    ${sellprice}
    Open Browser    https://snailpet.com/index \ \ \ \
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18964380560
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    000000
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[3]/div[1]
    Sleep    3
    Click Element    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[2]/div[1]/a[1]
    Sleep    3
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[3]/div[1]/div/div/input    ${barcode}
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[4]/div[1]/div/div/input    ${goodname}
    Select From List By Index    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[1]    2
    Select From List By Index    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[2]    2
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[9]/div[1]/div/div/input    ${inprice}
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[9]/div[2]/div/div/input    ${sellprice}
    Sleep    3
    Element Should Contain    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[3]/table/tbody/tr/td[2]    ${goodname}
    Close Browser

query_sell
    [Arguments]    ${text}
    Open Browser    https://snailpet.com/index
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    18964380560
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    000000
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[5]/div[1]
    Element Should Contain    xpath:/html/body/app-root/div/snail-else-main/snail-sale/div[1]/div[2]/div/div[1]    ${text}
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
    Click Element    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[1]/div
    Input Text    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[2]/div/input    ${name}
    Input Text    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[3]/div/input    ${comment}
    Click Element    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[3]/div[2]
    Click Element    xpath:/html/body/app-root/div/ng-component/snail-sale/div[2]/div/div/div[2]/div[1]/div/div/div/ul
    Element Should Contain    xpath:/html/body/app-root/div/ng-component/ng-component/div[1]/div[2]/div/div/div/button[1]    ${comment_text}
    Close Browser
