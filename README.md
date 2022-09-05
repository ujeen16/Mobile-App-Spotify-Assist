# Mobile-App-Spotify-Assist
## What is it

The idea behind the app is simple.  I like to listen to my favorite artists on Spotify
but am very busy and sometimes don't notice a new upload for some time.  This app allows a user to create an account and login.  Once logged in a user may update
a list which scrolls down the screen of the artist which they want to keep up to date with.  Whenever a new song comes out on the spotify api it is automatically 
added to an album in the users account.


## How it works

This app is designed using flutter, dart, firebase firestore, and python.  Flutter, Dart, and Firebase are utilized for the account creation and frontend appearance.  Python is utilized for the script which updates the user song preferences.

## The app

The app begins with a basic login section upon openning the application.  If you have not created an account or enter an invalid
email the appropriate error message will be displayed.

![login_page](https://user-images.githubusercontent.com/52471959/188341120-1261dee7-0403-43ce-a274-10c246e4017d.png) 
![failed_login](https://user-images.githubusercontent.com/52471959/188341345-ad1ea238-4ced-4278-83fc-60f9b1997be4.png)

When clicking the registration button the screen is changed to the registration page.  This page also will report invalid inputs
and display appropriate responses.

![failed_account_creation](https://user-images.githubusercontent.com/52471959/188341434-e0bcf5e4-e1ae-4cfd-8421-58e5b8385e00.png)
![account_creation](https://user-images.githubusercontent.com/52471959/188341482-af67e9e7-fc16-47b2-955c-c9fe2433ec96.png)

When loading any page the wait time is displayed with a loading icon.

![loading_screen](https://user-images.githubusercontent.com/52471959/188341322-eb55fcd3-1362-47a9-89da-6706656d9566.png)

Once successfully logged in with a created account the user has the ability to view their current artists which is initially empty.  
By utilizing the settings button the user is able to input their artists of interest.  The list is updated after every update event.

![empty_app](https://user-images.githubusercontent.com/52471959/188341572-69d44f5e-e32e-428b-a12c-dbcb24498bda.png)
![updating artists](https://user-images.githubusercontent.com/52471959/188355860-6acafbc6-cf71-4f39-921a-521dfc516e69.png)
