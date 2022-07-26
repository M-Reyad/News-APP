#  News APP
News APP is a simple application that is using HTTP REST API from ** https://newsapi.org/ ** for searching and retrieving live articles from all over the web. 

### It can help you answer questions like:
List {
    What top stories is TechCrunch running right now?
    What new articles were published about the next iPhone today?
    Has my company or product been mentioned or reviewed by any blogs recently?
    You can search for articles with any combination of the following criteria:
    }

### Keyword or phrase. Eg: 
List {
find all articles containing the word 'Microsoft'.
Date published. Eg: find all articles published yesterday.
Source domain name. Eg: find all articles published on thenextweb.com.
Language. Eg: find all articles written in English.
}

### Architecture Pattern Used : MVC

## Screens
App Consists of Two Screens :-

List {
Home Screen
Top Headlines Screen
}

#### Home Screen:
Fetches all the News and Articles sorted by Date, Newest to Oldest, in a UITable View Form Using the Search Button Inputs with three Languages: Arabic, English and French.

Once a News is selected, it can be shown in a Detailed Scrollable Screen.

#### Top Headlines Screen:
Fetches Top Headlines News and articles in a selected Country sorted by Date, in a Collection View Form Newest to Oldest, Using the Country Picker.

Once an article is selected, it uses WebKit to open its link in a separate Screen.


### Live Images
