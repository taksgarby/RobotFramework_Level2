<h3>This is a work in progress and will be updated frequently.</h3>

## Learning materials

- [Robocorp Developer Training Courses](https://robocorp.com/docs/courses)
- [Documentation links on Robot Framework](https://robocorp.com/docs/languages-and-frameworks/robot-framework)
- [Example bots in Robocorp Portal](https://robocorp.com/portal)

**My Learning**

I am learning towards Robot Framework Level 2. </br>

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
: The task failure was avoided by giving 1 minute timeout instead of retry 3 times. </br>

 Wait Until Keyword Succeeds    3x    2 sec    Submit the order    *fail</br>
 Wait Until Keyword Succeeds    1 min    2 sec    Submit the order  *pass</br>

: Naming the PDF files with their respective order id.  </br>

${OUTPUT_DIR}${/}images${/}${order_id}.png</br>

![Screenshot 2023-07-11 at 09 17 46](https://github.com/taksgarby/RobotFramework_Level2/assets/91882718/25e0d764-2446-4367-a2c8-335943b71ad5)



Update - 
I have completed all the required tasks and passed the theory test:) 

Next step - 
More practice using the Control Room.
