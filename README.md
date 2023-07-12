<h4>This is the robot I created for Robocorp Level 2 Certificate</h4>

<h4>Learning materials</h4>

- [Robocorp Developer Training Courses](https://robocorp.com/docs/courses)
- [Documentation links on Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework)

**My Learning**

<b>The main goal of Level 2</b> </br>
: To create and run my own robot </br>
: To learn best practices </br>
: To have a solid understanding of the basics of Robocorp automation </br>

<b>My robot should: </b></br>
: Use the orders file (.csv ) and complete all the orders in the file. </br>
: Save each order HTML receipt as a PDF file.</br>
: Save a screenshot of each of the ordered robots.</br>
: Embed the screenshot of the robot to the PDF receipt.</br>
: Create a zip file of the screenshots in a new directory. </br>

<b>Learning curves</b></br>
: The task failure was avoided by giving 30 seconds timeout instead of retry 3 times. </br>

Wait Until Keyword Succeeds    3x    2 sec    Submit the order    *fail</br>
Wait Until Keyword Succeeds    30 sec    2 sec    Submit the order  *pass</br>

![Screenshot 2023-07-11 at 09 17 46](https://github.com/taksgarby/RobotFramework_Level2/assets/91882718/25e0d764-2446-4367-a2c8-335943b71ad5)

: Naming the PDF files with their respective order id.  </br>

${OUTPUT_DIR}${/}images${/}${order_id}.png</br>


Update - 
I have completed all the required tasks and passed the theory test:) 

Next step - 
More practice using the Control Room.

Then - 
Learn towards Level 3 :) 
