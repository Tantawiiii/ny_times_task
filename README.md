# NY Times Most Popular Articles App

A simple Flutter app that fetches and displays the most popular articles from the New York Times API. Built using **Clean Architecture**, this app follows best practices for maintainability and scalability.

## Screenshots:
<p align="center">
  <img src="https://github.com/user-attachments/assets/4f189c5d-4b85-45c4-90c4-3c672a5ec783" width="250">
  <img src="https://github.com/user-attachments/assets/741ce920-f67f-4e52-a7dc-afad149cb642" width="250">
</p>

## Features:
- Fetch and display the most popular NY Times articles.
- View article details when tapped.
- Smooth UI with caching and shimmer loading effects.
- Implements Clean Architecture principles.
- Uses Dio for efficient API calls.
- Responsive UI using flutter_screenutil.

## API Information:
This app utilizes the **NY Times Most Popular Articles API**. To get started, sign up for an API key at [NY Times Developer Portal](https://developer.nytimes.com/get-started).

API Endpoint:
(https://api.nytimes.com/svc/mostpopular/v2/viewed/)?api-key=""

## Dependencies:
This project uses the following Flutter packages:

```yaml
flutter_screenutil: ^5.9.3
dio: ^5.0.0
provider: ^6.0.5
cached_network_image: ^3.4.1
shimmer: ^3.0.0
bounce: ^1.0.2

Project Structure:

lib:
    main.dart
     utils:
        networking:
            dio_client.dart
            api_constants.dart
      data:
       models:
          article_model.dart
        repositories:
           articles_repository.dart
     presentation:
         providers:
            articles_provider.dart
         screens:
            articles_details_screen.dart
            articles_list_screen.dart
         widgets:
            article_item.dart
            article_shimmer.dart
            build_custome_appbar.dart

