# INSTRUCTIONS #

In this file you will find some informations about how to execute the app, features, libs and etc.

### How to execute the app? ###

*You must have cocoapods installed on your computer.*

* Clone the **develop** Branch.
* Open the terminal and execute the **pod install**.
* Open the file *RickAndMortyWithFlow.xcworkspace* using the terminal command **open RickAndMortyWithFlow.xcworkspace**

### How the app works ###

* In the first time that tha app is opened it, the page number one is loaded.  
* The user can scroll down the collection to load the next page.  
* The user can search a character by tyiping the name of character.  
* The user can tap on character on list to detail it to see more informations like, location, number of episodes and etc.  
* The user can go to up of list tapping on clock area on navigation bar.  
* If the user cancels the research, the character list will be reloaded.  

### Briefly explain about my choices ###

* Architecture: MVVM + Coordiantor and RxSwift.
* Language: Swift 5.

### Libraries ###

|**Name of Library** | **Why I decided to use it?**                                                                                 |
|--------------------|--------------------------------------------------------------------------------------------------------------|
| Swinject           | I decided to use the Swinject to respect the dependecy inversion and single responsability SOLID principles. |
| SwinjectStoryboard | I decided to use the Swinject to respect the dependecy inversion and single responsability SOLID principles. |
| Kingfisher         | I decide to use it to do image cache.                                                                        |
| Moya               | I decided to use it because this framework abstracts the network layers improving the development.           |
| RxSwift            | I decided to use it to simplify the development bind the viewmodel with the view.                            |
| RxCocoa            | I decide to use it because this framework abstracts the UIKit components with observer pattern implemented.  |
| RxSwiftUtilities   | I decided to use it to control the activity indicator while the data has been loading.                       |
| RxReachability     | I decided to use it to observe the connection status of the app.                                             |
| TTGSnackbar        | I decided to use it to emit an alert when reachability emits the connection status                           |

### App features: ###

**Feature 1**  
* Present a list of the available characters.* ✔️  
* The user should be able to paginate the results until no more data is available.* ✔️  

**Feature 2**  
* When the user selects a character, he should be taken to a new screen with the character profile.* ✔️  

**Feature 3**  
* On the list screen, the user should be able to search for a specific character by name.* ✔️  

**Extras (Optional)**  
* Handle no internet connection on device.* ✔️  
* Caching.* ✔️  