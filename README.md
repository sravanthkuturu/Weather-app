# WeatherApp
WeatherAppCodingExcercise

# Steps to Run Project:
1. Open Terminal in Mac Machine.
2. Clone the project from github using command.
  https://github.com/sravanthkuturu/Weather-app
3. Open  "WeatherAppCodingExcercise.xcworkspace" file using XCode.
4. In terminal run command pod install. This is an optional step.
4. Press [Command + R] to run the project.
5. Press [Command + U] to run test cases.

# Architecture Explanation:
1. MVVM Achitecture has been implemented to complete this Test assignment.
2. Cocoa pods has been used as a dependency manager. So, in order to run the project, please open "WeatherAppCodingExcercise.xcworkspace" file in xcode.
3. Object Oriented Programming (OOP|) and  Protocol Orinted Programming  (POP) paradigm has been followed in Network Layer.
4. Central Network Layer Has been followed using the Generics and Protocols oriented Aproach.
5. Project Code is written using Swift and native technology code without using third part libraries of Cocoa pods (Only SVProgressHud pod is used in the project).
6. Test cases has been written on order to cover the business logic in view model.
7. Codables are used for API response parsing.

# Third Party Used:
Only "SVProgressHud" pod is used in order to should the loader and block the UI interaction.

# NFR:
1. Validation of the empty input string is implemented.
2. UI is blocked until response does not come from API in order to avoid the unnecessary user interation since the response is being fetched from server.
3. Internet connectivity check has been placed before calling the API, in order to avoid unncessary API call which will result in failure mode.

    
# Project UI work flow:
![City list screen](https://user-images.githubusercontent.com/20845121/111344567-b7369e80-8639-11eb-902f-39d6424f3b3e.png)
![Details screen](https://user-images.githubusercontent.com/20845121/111344589-bb62bc00-8639-11eb-9d9b-35311eda9772.png)
![No internet screen](https://user-images.githubusercontent.com/20845121/111344593-bdc51600-8639-11eb-8f28-ddafaa98538c.png)
![Search screen](https://user-images.githubusercontent.com/20845121/111344618-c0c00680-8639-11eb-950f-6fc24ebf2c03.png)
![Validation](https://user-images.githubusercontent.com/20845121/111344630-c4538d80-8639-11eb-9655-41d8ac775ef1.png)

