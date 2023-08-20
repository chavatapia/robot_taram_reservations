*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
Airbnb_Reservations
    Catenate        
    Open Browser    https://www.airbnb.com/    chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Sleep    4
    #Click Button    XPath=//button[@data-testid='cypress-headernav-profile']                
    Press Keys      XPath=//button[@data-testid='cypress-headernav-profile']      ENTER
    Sleep    1
    Click Button    XPath=//button[@data-testid='social-auth-button-email']
    Sleep    1 
    Input Text    XPath=//input[@data-testid='email-login-email']    chavatr@gmail.com
    Sleep    1
    Click Button    XPath=//button[@data-testid='signup-login-submit-btn'] 
    Sleep    1
    #Input Text    XPath=//input[@data-testid='email-login-email']    chavatr@gmail.com 
    
    #Press Keys    XPath=//span[@class='_kaq6tx']    ENTER
    Input Password    //input[@data-testid='email-signup-password']    Salva1021?
    Press Keys    //input[@data-testid='email-signup-password']    ENTER
    Sleep    4 
    #Press Keys    //div[@class='l1hgmivi dir dir-ltr']    ENTER    #SwitchToHosting
    #Press Keys    //button[@class='_m7zt8']    ENTER    #MenuButton
    #Go To    https://www.airbnb.com/api/v2/download_reservations?_format=for_remy&_limit=80&_offset=0&collection_strategy=for_reservations_list&date_min=${now}&sort_field=end_date&sort_order=asc&status=accepted%2Crequest&page=1&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en
    ${now}    Evaluate    '{dt:%Y}-{dt:%m}-{dt:%d}'.format(dt=datetime.datetime.now())    modules=datetime
    ## UPCOMING
    ${Req}    Catenate    SEPARATOR=    https://www.airbnb.com/api/v2/download_reservations?_format=for_remy&_limit=80&_offset=0&collection_strategy=for_reservations_list&date_min=    ${now}    &sort_field=start_date&sort_order=asc&status=accepted%2Crequest&page=1&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en
    Go To    ${Req}
    Sleep    4
    ${Req}    Catenate    SEPARATOR=    https://www.airbnb.com/api/v2/download_reservations?_format=for_remy&_limit=40&_offset=40&collection_strategy=for_reservations_list&date_min=    ${now}    &sort_field=start_date&sort_order=asc&status=accepted%2Crequest&page=2&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en
    Go To    ${Req}
    Sleep    4
    ## COMPLETED
    ${Req2}    Catenate    SEPARATOR=    https://www.airbnb.com/api/v2/download_reservations?_format=for_remy&_limit=40&_offset=0&collection_strategy=for_reservations_list&ends_before=    ${now}    &sort_field=end_date&sort_order=desc&status=accepted&page=1&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en
    Go To    ${Req2}
    Sleep    4
    ## CANCELLED
    Go To    https://www.airbnb.com/api/v2/download_reservations?_format=for_remy&_limit=40&_offset=0&collection_strategy=for_reservations_list&sort_field=start_date&sort_order=desc&status=canceled&page=1&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en
    Sleep    4

    ##Close Browser    
