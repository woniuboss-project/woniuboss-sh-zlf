*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
logindata
    [Template]    login
    15221858156    aiziji1314    xpath:/html/body/app-root/snail-header/div/div/span/a    安全退出
    15221858888    0000    xpath:/html/body/app-root/div/snail-index/div/div/div/div[4]    查看演示

customer_data
    [Template]    add_customer
    啦啦啦    13352464832    柚子
    哈哈哈    13124794683    高兴

add_goods_data
    [Template]    add_goods
    122222222    啊呜    3    6
    322222222    阿斯蒂芬    34    67

query_sales
    [Template]    query_sell
    首页

create_stock
    [Template]    create_stock
    第一次    0122    完成
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
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    15221858156
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    aiziji1314
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
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    15221858156
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    aiziji1314
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[3]/div[1]
    Sleep    3
    Click Element    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[2]/div[1]/a[1]
    Sleep    3
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[3]/div[1]/div/div/input    ${barcode}
    Input Text    xpath:/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[4]/div[1]/div/div/input    ${goodname}
    Select From List By Index    xpath/html/body/app-root/div/ng-component/div/div/snail-product-stock/div[5]/div/div/div[2]/div/div[8]/div[1]    2
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
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    15221858156
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    aiziji1314
    Click Element    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/a
    Sleep    5
    Click Element    xpath:/html/body/app-root/div/snail-menu-nav/div/a[5]/div[1]
    Element Should Contain    xpath:/html/body/app-root/div/snail-else-main/snail-sale/div[2]/div/div/ul/li[1]    ${text}
    Close Browser

create_stock
    [Arguments]    ${name}    ${comment}    ${comment_text}
    Open Browser    https://snailpet.com/index
    Sleep    5
    Click Element    xpath:/html/body/div[3]/div/div/div[3]/div[2]
    Input Text    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[1]    15221858156
    Input Password    xpath:/html/body/app-root/div/snail-index/div/div/div/div[3]/div/div[1]/input[2]    aiziji1314
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
