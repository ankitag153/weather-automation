# weather
This project is for automation weather APIs. 
How to :
	Clone the above repository in your local machine
	Open the project in IntelliJ and right click on project and click : “Build Module : ‘weather-automation”
	Expand the project on left side and Navigate to src->test->java->examples.weather->current->WeatherRunner. Right click and click on Run WeatherRunner
	Navigate to your local machine project folder  and check folder “cucumber-html-reports”.
	Click on the .html file to see the Cucumber Report


Bugs Found:

1)	Optional Parameters in Query params for both APIs are not respected. API returns 200 even if the optional parameter values are incorrect
Example: 
https://api.weatherbit.io/v2.0/current?lat=562.36969&lon=789.3695&marine=test&units=a&lang=oi&key=f767c102bb874909878729858a9ca968
