# Flutter MVVM Architecture With Rest APIs Using Provider With Solid Principles

Topic:

- Road Map
- What is MVVM Architecture
- Handle App Exceptions
- Handle App APIs Response
- Network APIs Services
- Named Routes
- Utils
- Login View & View Model
- Sign Up View & View Model
- Manage User Session
- GET APIs

## Directory Structure

- data
  - network
  - response
  - app_exceptions.dart
- model
- res
- repository
- utils
- view
- view_model
- main.dart

## Steps

Exception Handle:

- Add exceptions into *app_exceptions.dart*
  - Fetch data error
  - Invalid input
  - Bad request
  - Unauthorized

API Response:

- Create status enum for loading, completed and error into *response/status.dart*
- Create APIResponse into *response/api_response.dart*

Network Services:

- Create "Base API Service" into *network/base_api_service.dart*
  - Create abstract methor for GET
  - Create abstract methor for POST
  - Create abstract methor for PUT
  - Create abstract methor for PETCH
  - Create abstract methor for DELETE
- Create "Network API Service" into *network/network_api_service.dart*

Route:

- Create __routes_name.dart__ file into *utils/routes* directory
- Create __routes.dart__ file into *utils/routes* directory

Utils:

- Add custom messages into *utils.dart* file from __utils__ directory
  - Toast Message
  - Error Message using *Flushbar*
  - Snackbar

Create *toastMessage* using __fluttertoast__ package & *snackBar* using __snackbar__ methods for message. And *errorMessage* using __another_flushbar__ package method for error message.

Install Package:

- fluttertoast
- another_flushbar
- http

[Tutorial](https://www.youtube.com/playlist?list=PLFyjjoCMAPty6KBBqiwwbIU07wFIItYyH)
