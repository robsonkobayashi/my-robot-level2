*** Settings ***
Documentation       Orders robots from RobotSpareBin Industries Inc.
...                 Saves the order HTML receipt as a PDF file.
...                 Saves the screenshot of the ordered robot.
...                 Embeds the screenshot of the robot to the PDF receipt.
...                 Creates ZIP archive of the receipts and the images.

Library             RPA.PDF
Library             RPA.HTTP
Library             RPA.Archive
Library             RPA.Browser.Selenium    auto_close=${False}


*** Tasks ***
Order robots from RobotSpareBin Industries Inc
    Open the robot orders web
# ToDo:    Get Orders from file
# ToDo: loop
    Close the annoying modal
    Fill the form
    Download and store the receipt
    Order another Robot
# end loop
    Archive output PDFs
# ToDo: TEARDOWN
    Close RobotSpareBin Browser


*** Keywords ***
Open the robot orders web
    Open Available Browser    https://robotsparebinindustries.com/#/robot-order

Get Orders from file

Close the annoying modal
    Click Button When Visible    //*[@id="root"]/div/div[2]/div/div/div/div/div/button[1]

Fill the form
    Select From List By Value    head    2
    Select Radio Button    body    2
    Input Text    xpath:/html/body/div/div/div[1]/div/div[1]/form/div[3]/input    2
    Input Text    address    Address 2
    Click Button    preview

    Wait Until Keyword Succeeds    3x    10s    Click Button    order

#    Wait Until Keyword Succeeds    3x    1s    Wait Until Page Contains    Thank you for your order    1s
#    Click Button    order

Download and store the receipt

Order another Robot

Archive output PDFs

Close RobotSpareBin Browser
