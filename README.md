
# AQI   
          
## Tech
Xcode 11.7 / Swift 5 (master branch)
iOS >= 13.0 (Use as an Embedded Framework)
macOS >= 10.15.7

## bUsed MVVM git Architecture      
Model-View-ViewModel (MVVM) is a design pattern that’s gained traction in the iOS development community in recent years. It involves a new concept called a view model. In iOS apps, a view model is a companion object to a view controller.
  
## The layers used in Application 
1. APP
2. Views
3. controllers
4. Utilities

As shown above, the MVVM pattern consists of three layers:
1. Model: App data that the app operates on.
2. View: The user interface’s visual elements. In iOS, the view controller is inseparable from the concept of the view.
3. ViewModel: Updates the model from view inputs and updates views from model outputs.

## In utilities file (business logic)
1. performing validation, 
2. sockethandeling 
3. config class through which i am  getting base URL 

## charts 
1.Add pod 'Charts' to your Podfile. "Charts" is the name of the library.
2.Chart type used in Application:PieChart (with animation)

## core logic
1. Implemented websocket connection with baseURL("ws://city-ws.herokuapp.com/") for geeeting AQI status in every 30S.
2. Added the colour code with status, while displaying the AQI value for the city.
3. if we select the city, will show chart in PI chart style with AQI index.
