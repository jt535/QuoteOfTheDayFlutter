# Quote of the Day

This is a little demo app that I made at the [Adventures in Flutter Meetup](https://www.meetup.com/Adventures-in-Flutter-Firebase). Contact me on [LinkedIn](https://www.linkedin.com/in/je-thompson).

![main screen](./docs/usage.gif)

# Design

The app pulls the *quote of the day* from [quote.rest](http://quotes.rest) using [dio](https://pub.dev/packages/dio) and caches it using [dio_http_cache](https://github.com/hurshi/dio-http-cache). JSON deserialisation is completed with [json_serializable](https://pub.dev/packages/json_serializable) and [json_annotation](https://pub.dev/packages/json_annotation).

The app injects a *view model* into the UI using [provider](). The app is broken down into three packages
* *api* which contains the quote of the day API client
* *pages* which contains the one screen of the app
* *widgets* which contains all of the widgets created for the app

## Usage

You can tap the screen to reload the *Quote of the Day*. Long press the app and it will show a test error message which would otherwise be shown when the quote of the day could not be downloaded.

# Future work

* Add super-cool extra-amazing animations
* Add the ability to retrieve the *quote of the day* for different categories
