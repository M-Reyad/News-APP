#  News APP
News APP is a simple application that is using HTTP REST API from ** https://newsapi.org/ ** for searching and retrieving live articles from all over the web. 

### It can help you answer questions like:

    - What top stories is TechCrunch running right now?
    - What new articles were published about the next iPhone today?
    - Has my company or product been mentioned or reviewed by any blogs recently?

You can search for articles with any combination of the following criteria:

    - Keyword or phrase. Eg: Find all articles containing the word 'Microsoft'.
    - Date published. Eg: find all articles published yesterday.
    - Source domain name. Eg: find all articles published on thenextweb.com.
    - Language. Eg: find all articles written in English.

### Architecture Pattern Used:
MVC is selected to be the architecture for the app.

## Screens
App Consists of Two Screens :-

    - Home Screen
    - Top Headlines Screen

#### Home Screen:
Fetches all the News and Articles sorted by Date, Newest to Oldest, in a UITable View Form Using the Search Button Inputs with three Languages: Arabic, English and French.
Once an Article is selected, it can be shown in a Detailed Scrollable Screen.

#### Top Headlines Screen:
Fetches Top Headlines News and articles in a selected Country sorted by Date, in a Collection View Form Newest to Oldest, Using the Country Picker.
Once an article is selected, it uses WebKit to open its link in a separate Screen.


### Live Images

<img src="https://user-images.githubusercontent.com/93882864/181115777-61d50a88-bac7-4d83-8758-565636724fad.png" width="207" height="448">
<img src="https://user-images.githubusercontent.com/93882864/181115802-552f3e0a-2997-472a-a508-410a3613f8bd.png" width="207" height="448">

#### Home with Different Three Languages


<img src="https://user-images.githubusercontent.com/93882864/181115919-b2a79545-f470-4ea7-b51e-3a5a799e7d4b.png" width="207" height="448">
<img src="https://user-images.githubusercontent.com/93882864/181115931-ff21ceb5-e943-4390-a748-3d8a4769335e.png" width="207" height="448">
<img src="https://user-images.githubusercontent.com/93882864/181115945-9b0b41b5-f232-4216-a43e-835f3dcab188.png" width="207" height="448">

#### Searching for an article containing word "Egypt" and the results are sorted by Date.


<img src="https://user-images.githubusercontent.com/93882864/181116216-220510b7-824f-4799-b4e5-f1ae558c706c.png" width="207" height="448">

#### Searching for Articles containing "Egypt" but in Arabic


<img src="https://user-images.githubusercontent.com/93882864/181116057-d27ed854-e28f-42de-8521-0718ee812844.png" width="207" height="448">

#### Headlines in Egypt


<img src="https://user-images.githubusercontent.com/93882864/181116382-3f6bd662-6bc2-4ea3-8bb4-d397662ae2f6.png" width="207" height="448">
<img src="https://user-images.githubusercontent.com/93882864/181116482-c705b075-1af8-4af2-a385-e6a78984d3bc.png" width="207" height="448">
<img src="https://user-images.githubusercontent.com/93882864/181116507-27bfcbc0-128f-4c5f-b977-453b073384d8.png" width="207" height="448">

#### Tapping on the article to see the details in Scrollable Content


<img src="https://user-images.githubusercontent.com/93882864/181116145-6922a370-fb37-4000-b85b-5967d2fe39ba.png" width="207" height="448">

#### Loading the Article Page using Webkit.

