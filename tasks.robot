*** Settings ***
Documentation       Orders robots from RObotSpareBin Iindustries Inc.
...                 Saves the order HTML receipt as a PDF file.
...                 Saves the screenshot of the ordered robot.
...                 Embeds the screenshop of the robot to the PDF receipt.
...                 Creates ZIP archive of the receipts and the images.

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.HTTP
Library             RPA.Tables
Library             RPA.PDF
Library             RPA.FTP
# for creating zip archive
Library             RPA.Archive
# Mute On Run Failure keyword prevents keywords from generating a screenshot on failure
Library             RPA.RobotLogListener


*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Mute Run On Failure    Run Keyword
    Open the robot order website
    Download the CSV file
    Process orders
    Create a ZIP file of receipt PDF files
    [Teardown]    Close the browser


*** Keywords ***
Open the robot order website
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Download the CSV file
    RPA.HTTP.Download    https://robotsparebinindustries.com/orders.csv    overwrite=True

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
        Wait Until Keyword Succeeds    30 sec    2 sec    Submit the order
        ${pdf} =    Store the receipt as a PDF file    ${order}[Order number]
        ${screenshot} =    Take a screenshot of the robot image    ${order}[Order number]
        Embed the robot screenshot to the receipt PDF file    ${screenshot}    ${pdf}
        Wait Until Keyword Succeeds    30 sec    2 sec    Click to order another robot
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

Store the receipt as a PDF file
    [Arguments]    ${order_id}
    ${receipt_html} =    Get Element Attribute    id:receipt    outerHTML
    Html To Pdf    ${receipt_html}    ${OUTPUT_DIR}${/}receipts${/}${order_id}.pdf
    RETURN    ${OUTPUT_DIR}${/}receipts${/}${order_id}.pdf

Take a screenshot of the robot image
    [Arguments]    ${order_id}
    Screenshot    id:robot-preview-image    ${OUTPUT_DIR}${/}images${/}${order_id}.png
    RETURN    ${OUTPUT_DIR}${/}images${/}${order_id}.png

Embed the robot screenshot to the receipt PDF file
    [Arguments]    ${screenshot}    ${pdf}
    Open Pdf    ${pdf}
    Add Watermark Image To Pdf    image_path=${screenshot}    output_path=${pdf}
    Close Pdf    ${pdf}

Create a ZIP file of receipt PDF files
    ${zip_file_name} =    Set Variable    ${OUTPUT_DIR}/PDFs.zip
    Archive Folder With Zip
    ...    ${OUTPUT_DIR}${/}receipts
    ...    ${zip_file_name}

Close the browser
    Close Browser
