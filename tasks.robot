*** Settings ***
Documentation       Orders robots from RObotSpareBin Iindustries Inc.
...                 Saves the order HTML receipt as a PDF file.
...                 Saves the screenshot of the ordered robot.
...                 Embeds the screenshop of the robot to the PDF receipt.
...                 Creates ZIP archive of the receipts and the images.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.HTTP
Library             RPA.Tables


*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open the robot order website
    Download the CSV file
    # Close the modal
    Maximize Browser Window
    Process orders


*** Keywords ***
Open the robot order website
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Download the CSV file
    Download    https://robotsparebinindustries.com/orders.csv    overwrite=True

Get Orders
    ${orderTable} =    Read table from CSV    orders.csv
    RETURN    ${orderTable}

Process orders
    ${orders} =    Get Orders
    Log    ${orders}
    FOR    ${order}    IN    @{orders}
        Close the modal
        Fill the form and submit    ${order}
        Preview the robot
        Wait Until Keyword Succeeds    1 min    2 sec    Submit the order
        Wait Until Keyword Succeeds    1 min    2 sec    Click to order another robot
    END

Close the modal
    Click Button    css:.btn.btn-dark

Fill the form and submit
    [Arguments]    ${robotOrder}
    Select From List By Value    head    ${robotOrder}[Head]
    Select Radio Button    body    ${robotOrder}[Body]
    Input Text    css:.form-control    ${robotOrder}[Legs]
    Input Text    address    ${robotOrder}[Address]

Preview the robot
    Click Button    preview

Submit the order
    Click Button    order
    Wait Until Element Is Visible    id:order-completion

Click to order another robot
    Click Button    order-another
