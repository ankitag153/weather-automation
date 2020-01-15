# weather
This project is for automation weather APIs. 
Since Karate is an open-source Java project, it can run almost anywhere. Here’s my system config:

1) Windows 10 , 64 Bit OS
2) Java 1.8.0_40
3) Apache Maven 3.6.1
4) Karate 0.9.5.RC5
5) Intellij Community Edition
-- In Intellij IDE, click on Settings> Plugins
   Download the plugins for   Maven, Gherkin and Cucumber for Java. Restart IDE

How to :
1)	Clone the above repository in your local machine. Maven would start importing some repository. It should import completely and then follow further steps.
2) Open the project in IntelliJ and right click on project and click : “Build Module : ‘weather-automation”. 
3) 	Expand the project on left side and Navigate to src->test->java->examples.weather->current->WeatherRunner. Right click and click on Run WeatherRunner
4)	Navigate to your local machine project folder  and check folder “cucumber-html-reports”. The existing run report is available in target folder
5)	Click on the .html file to see the Cucumber Report


Bugs Found:

1)	Optional Parameters in Query params for both APIs are not respected. API returns 200 even if the optional parameter values are incorrect
Example: 
https://api.weatherbit.io/v2.0/current?lat=562.36969&lon=789.3695&marine=test&units=a&lang=oi&key=f767c102bb874909878729858a9ca968
