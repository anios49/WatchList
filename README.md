# WatchList - Please go through the README.md file for details.
STAN coding assessment

# Implementation info
 * Please review the documents folder for screenshots and documents.

 * Created the seprate library for WatchListServices, which contain all functionality that could be reused by 3rd party developers in any application that requires programs historical data.
 
 * Used XCode 12.4 with Swift 5.

# Requirements

You will need to build a simple app with following 3 pages:
• Home – This will display 2 buttons which links to Series and Movies page

✅ @Animesh - Created the home screen by name "Program Options", it have two buttons.

• Series – This will display entries with programType == series, you can fetch the JSON feed from: https://raw.githubusercontent.com/StreamCo/react-coding-challenge/master/feed/sample.json

• Movies – This will display entries with programType == movie from the same json provided above. For both series and movies page, only display entries with releaseYear >= 2010and sort by title in ascending alphanumeric order. You will need to display image, title and release year of each entry using collection view.

✅ @Animesh - Used collection Views and displayed the data as per requirements. Filter and sorting logic is in "WatchListUtils" class.

✅ @Animesh - Filter and Sort -

![Screenshot 2021-12-05 at 7 47 49 PM](https://user-images.githubusercontent.com/43500940/144739902-b43518f8-7434-4c78-b4da-933215e3e7ab.png)


You are required to use Swift to write this app with certain coverage of unit test cases. 

✅ @Animesh - I have used Swift 5. 

✅ @Animesh - Included Unit and UI test cases for both WatchListService & WatchListApplication. 

✅ @Animesh - WatchListService - 90.9%,  WatchListApplication - 94.4%
 
![CodeCoverage](https://user-images.githubusercontent.com/43500940/144739546-aed153f2-09a5-4272-9fd4-5ead4b1dbd94.png)

No 3rd-party frameworks should be used.

✅ @Animesh - Not used any third party.

# Screenshots: 
![MovieList](https://user-images.githubusercontent.com/43500940/144739430-8ce8b002-eadf-4b9c-a0a9-d9717b66f3b5.png)       ![MovieList](https://user-images.githubusercontent.com/43500940/144739420-a1ccfe7c-0777-4297-8f2a-0b29d768a7cc.png)

# Code Coverage: 
 WatchListService - 90.9%,  WatchListApplication - 94.4%
 
![CodeCoverage](https://user-images.githubusercontent.com/43500940/144739546-aed153f2-09a5-4272-9fd4-5ead4b1dbd94.png)


# Application Run & Compile steps
* Clone source code.

* Open WatchList.xcodepoj.

* Build the WatchListServices framework.

* Change target to WatchList and run the application

# WatchListService Framework UML

![WatchListServiceUML](https://user-images.githubusercontent.com/43500940/144745845-e8d39114-3303-4034-b2f5-a3a0da6a1b72.png)

# WatchList Application UML

![WatchListUML](https://user-images.githubusercontent.com/43500940/144745850-2e8f4a6d-b8df-4a85-b7b5-c211d0892c41.png)
