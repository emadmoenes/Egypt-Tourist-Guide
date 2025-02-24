# Egypt Tourist Guide - Mobile Application

## Project General Description

The **Egypt Tourist Guide** is a mobile application designed to help tourists explore landmarks, museums, and attractions across various Egyptian governorates. The app provides a user-friendly interface for discovering popular places, saving favorites, and managing user profiles. This project aims to enhance the tourism experience by offering curated suggestions and personalization.

---

## Pages & Features 

### 1. Signup Page
- **Input Fields**: Full Name, Email, Password, confirm password, Phone Number (optional).
- **Validation**: There are some conditions to ensure successful sign up. 
   The validations are:          
   1- The name must be not empty.              
   2- The email field must contains @                     
   3- The password field must have at least 8 characters.            
   4- The password must contain at least one uppercase letter.          
   5- The password must contain at least one lowercase letter.            
   6- The password must contain at least one digit(0-9).            
   7- The password must contain at least one special character.                
   5- The password and confirm password fields must be the same.               
- **Data Handling**: Input data is saved in variables.
- **Navigation**: Includes a **Signup** button that directs users to the **Login Page**.

### 2. Login Page
- **Input Fields**: Email and Password.          
- **Validation**: Checks credentials against saved data (in shared pref).    
- **Token**: After the login process, there is a dummy token saved in shared pref. so, the user don't have to login again.   
- **Navigation**: Successful login redirects users to the **Home Page**.    

### 3. Home Page
- **Suggested Places to Visit**: Displays attractions in a grid view.
- **Popular Places Section**: Displays horizontally scrollable cards for popular attractions.
  - Each card includes:
    - Image of the place.
    - Name of the place.
    - Governorate name.
    - The place's description.
    - A favorite icon (toggle on/off).

### 4. Governorates Page
- The page displays a list of governorates.
- **Navigation**: Selecting a governorate navigates to a page showing landmarks specific to that governorate.

### 5. Profile Page
- The page displays user details including:
  - Full Name
  - Email
  - Address
  - Phone number
  - Password (hashed for security).
- The user can update his data.
- There is a logout button at the bottom of the page.

### 6. Favorites Page
- Displays a list of favorite places.
- Static cards similar to the **Popular Places** section.

### 7. Bottom Navigation Bar
- Visible on main pages: **Home**, **Governorates**, **Favorites**, **Profile**.
- Includes icons for easy navigation:
  - Home
  - Governorates
  - Favorites
  - Profile

### 8. Page Navigation Animations
- Smooth animations for transitions between pages.
- SlideRightRoute
- FadeTransitionRoute

### 9. Localization
- Apply localization feature (Ar and En) to adapt the app to different languages and regions.
- Using easy localization package.
------

## Navigation Flow
1. **Login Page** → **Signup Page** → **Home Page**
2. **Home Page** → **Governorates Page** → **Landmarks Page**
3. **Home Page** → **Favorites Page**
4. **Home Page** → **Profile Page**

------

## App Structure
The code is organized using **MVC Architecture** for clean and maintainable code structure.                   
The main folders in lib are:
- **controllers**: contains controllers which deal with presentaion layer to handle logic (home controller, auth controller, and profile controller).
- **core**: define lang and services logic folders. also, the other general files in the app (lang folder, services folder).
- **models**: define the data models (place model, governorate model, user model, and screen model).
- **views**: UI design and components (screens and widgets).

-------

## **Packages Used**
- **SharedPreferences**: For local data storage and offline support ==> https://pub.dev/packages/shared_preferences.
- **easy_localization**: For localization feature ==> https://pub.dev/packages/easy_localization.
- **flutter_bloc**: For state management using bloc (cubit) ==> https://pub.dev/packages/flutter_bloc.
