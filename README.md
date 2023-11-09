# TheMovieDB App

## [ PART 1 ] - Create an app to show data from a movie.

**- STEPS:**

- **For each relevant functionality, you must create a new branch (feature branch)** from the
  updated main branch.

- Once you have finished your task, you should make a commit and a Pull Request (PR) for that task.
  The PR will pass through a revision process in charge of some mentor before being merged.
- Create a new Flutter project on Android Studio. Delete all the generated code from the **main**
  file.
- [Define a SafeArea](https://flutter-examples.com/safearea-widget-in-flutter/)
- Show the information from the given movie:
  - **Title**: The Super Mario Bros. Movie
  - **Original title**: The Super Mario Bros. Movie
  - **Overview**: While working underground to fix a water main, Brooklyn plumbers—and
    brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new
    world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.
  - **Release date**: 2023-04-05
  - **Vote average**: 7.8
  - **Genres**: [Animation, Family, Adventure, Fantasy, Comedy]
  - **Poster**: [POSTER](https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg)
  - **Backdrop**: [BACKDROP](https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg)
- Add a “Like” counter and a button to raise that counter.

## [ PART 2 ] - Create an App to display a Movie list with details page.

**- STEPS:**

- A Movies list app using mocked data from a JSON. The original data was fetched from
  the [TheMovieDB API](https://developer.themoviedb.org/reference/intro/getting-started) and
  modified for simplicity: This exercise was made to explain:
  - [Scrollable widgets](https://drive.google.com/drive/folders/1WDI13a02YHJ65opd5Fsdgx61lyhfHHSU?usp=drive_link) (SingleChildScrollView and ListView)
  - Common-use widgets
  - [Navigation between Pages](https://drive.google.com/drive/folders/10San6cz5vUtfmyjH7Ywo7OctRIs93hhK?usp=drive_link)
  - Data Modeling and JSON parsing

- The main objective of this exercise is to introduce JSON consumption. The students will modify
  their current project, a movies list application that fetches its data from a mocked local source,
  parsing and modeling the data.

- You will use
  the [previous movie](https://docs.google.com/document/d/1QwhzSIIW8qr0C01PmJQGrxAUqIVOFKO-/edit)
  card and add the new information that the json has, to complement the card.

**- LOCAL SOURCE:**

- Here is the json with the movies that you will use:
  - [Movies Mock Data](https://drive.google.com/drive/folders/1up0-hwo-SZw6-FowWzlwybor8KDjojWC)
  - [Genres Mock Data](https://drive.google.com/drive/folders/1up0-hwo-SZw6-FowWzlwybor8KDjojWC)

## [ PART 3 ] - Modify the project structure, based on the Clean Architecture.

**- STEPS:**

- Read the Clean Architecture documentation:
  - [Explore Clean Architecture](https://medium.flutterdevs.com/explore-clean-architecture-in-flutter-3fff83e0f1f2)
  - [Flutter Clean Architecture Series — Part 1](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)
  - [Flutter Clean Architecture Series — Part 2](https://devmuaz.medium.com/flutter-clean-architecture-series-part-2-bcdf9d38fe41)
  - [Flutter Clean Architecture Series — Part 3](https://devmuaz.medium.com/flutter-clean-architecture-series-part-3-cdfbcb8d449b)

- Implement Clean Architecture, creating the recommended empty files and folders, from
  this [Example Repository](https://github.com/MarcosCGlobant/flutter_clean_architecture_example).
  (This should be made on a different branch). In the readMe of the example there is some explanation
  of the structure used.

- Read about and add lint to the application [lint package](https://pub.dev/packages/lint).

## [ PART 4 ] - Introduction to API Rest calls from the Flutter side, using HTTP Protocol.

**- STEPS:**

- Read the BLoC documentation:
  - [BLoC Master Class](https://drive.google.com/file/d/17equukIa4dX_VTxBMrUROXL-ItrzB8no/view?usp=sharing)
  - [Architect your Flutter project using BLOC pattern](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1)
  - [Architect your Flutter project using BLOC pattern (Part 2)](https://medium.com/codechai/architect-your-flutter-project-using-bloc-pattern-part-2-d8dd1eca9ba5)

- Implement the [HTTP](https://pub.dev/packages/http) package for the service call.

- Read the HTTP documentation:
  - [Flutter Talk - Http Request](https://docs.google.com/presentation/d/1P-Tx3NrIm6GcswFeGAQiFc_iayRlpzaU_ItCdo1bIkM/edit?usp=drive_link)
  - [Flutter Talk](https://drive.google.com/file/d/1H6ADrFJ23bMULInCypzk43Cdg8mfaDW3/view?usp=drive_link)
  - Packages:
    - [Http](https://pub.dev/packages/http)
    - [Cached Network Image](https://pub.dev/packages/cached_network_image)
  - Using the API endpoints, implement a Page View to show different groups of cards
  - Create all the entities and models needed to accomplish the call.
  - Add some lint rules to the ***analysis_options.yaml*** file, to test the functionality. You can
    check the rules from this [dev doc](https://dart.dev/guides/language/effective-dart/style)
    or [this one](https://dart-lang.github.io/linter/lints/)
  - Read about Testing in Flutter:
    - Testing Flutter apps.
    - Testing Introduction.
      - Testing Flutter apps.
      - Hands-on beginner’s guide.
  - Add some unit and widget tests to the application.
