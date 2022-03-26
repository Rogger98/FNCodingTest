# FNCodingTest
  FN Coding Test app implements POI Services and displays vehicles near by your location and you can choose vehicle.

# Requirements
  * Xcode 12.4 or later 
  * Swift 5.2 or later 
  * OS 14 or later 

# MapView 
  For the map view it created a framework `MapView` in Objective-C and it's reliable can be user in Swift and Objective-C
 
# How to user MapView Framework in Swift 
-----------------------------------------------------------------------------
  We can user `MapView` in Swift Project like this 
  
  #### Create Bridge Header File in Swift Project ####
  
<img width="500" alt="Screenshot 2022-03-26 at 11 53 54 AM" src="https://user-images.githubusercontent.com/44162605/160227604-80e85bd8-1b9d-42b5-9d01-3670ee1fbdf7.png">

  #### Configure Path for your Bridge Header File in Bundle settings ####
  
  <img width="500" alt="Screenshot 2022-03-26 at 11 57 18 AM" src="https://user-images.githubusercontent.com/44162605/160227657-799af1bd-85d6-4659-9818-51f0976f34b2.png">

  #### Now Import `MapView` in BridgeHeader.h File ####
  
  ` #import "MapView.h" `
  
  #### How to use? ####
To Show POI's on Map This how we can show Map View 

```
func showMap(data: [POI],selectedPOI:POI) {
        let mapController = MapViewController(data,screenTitle: StringConstants.MapScreen.screenTitle.localized, selectedPOI: selectedPOI)
        mapController.navigationItem.title = ""
        mapController.selectedVehicle = { selectedPoi in
            let message = "Message displayed from swift code Selected POI \(selectedPoi.description)"
            self.vehicleNavigationController?.showAlertWith(messsage: message , theam: .appName)
        }
        vehicleNavigationController?.pushViewController(mapController, animated: true)
}
```

Key             | Use 
--------------- | -----------------------------------
data            | array of [POI] List of vehicles 
screenTitle     | Title to show on Navigation Bar 
selectedPOI     | POI Details to show on Map Screen 
selectedVehicle | Callback that gives the POI which is selected on Map When user select any vehicle from Map
