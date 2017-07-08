# Example iOS

[![Language](https://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)
![](https://img.shields.io/badge/Swift%20version-3.1-red.svg)
[![codecov](https://codecov.io/gh/robertofrontado/Example-iOS/branch/master/graph/badge.svg)](https://codecov.io/gh/robertofrontado/Example-iOS)
[![Build Status](https://www.bitrise.io/app/58218597e7ddae87/status.svg?token=9--SSTEmy13Z55bXYIGqXw&branch=master)](https://www.bitrise.io/app/58218597e7ddae87)

# Installing

Clone the repo and run `pod install` :beers:

## Project Architecture

**MVP (Model-View-Presenter)** which its mainly divided in 3 layers: Data, Domain and Presentation.

### Data Layer:

This module is called data because it just manages data. Its main purpose is retrieving data from specific managers. These managers are classes which manage data from/to server endpoints or from/to the local cache depending on the current call from the presentation layer.

### Domain Layer:

For now it only contains the models, but if it were needed some extra logic, like `UseCases`, they would be placed here

### Presentation Layer:

This is where all the UI logic is placed. The presenter orchestrates the view (UIViewController) telling what to do through the view protocol (BaseView) which acts as a bridge between them.

The foundation of this layer lies in 3 base classes: [BaseViewController](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Base/BaseViewController.swift#L12), [BaseView](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Base/BaseView.swift#L9) and [BasePresenter](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Base/BasePresenter.swift#L9).

The presentation layer is separated in modules (such as Splash, Home and Checkout).

For each module, we would find those 3 base classes. I.E:

**Home module:**
- [HomeViewController](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Home/HomeViewController.swift#L12): In charge of the UI.
- [HomeView](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Home/HomeView.swift#L9): Brigde between the Presenter and the ViewController.
- [HomePresenter](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/Presentation/Home/HomePresenter.swift#L9): Business logic (Mainly fetch data from the managers and pass it to the viewController through the view).

## Dependency Injection
The projects uses [Swinject](https://github.com/Swinject/Swinject) for dependency injection.

Its defined in [ApplicationModule](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/DI/ApplicationModule.swift), but its separated in 2 modules as well:

- [Data Module](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/DI/DataModule.swift#L11): Defines the how to inject all the dependencies from the **data** layer.

- [PresentationModule](https://github.com/robertofrontado/Example-iOS/blob/develop/Example-iOS/DI/PresentationModule.swift#L11): Defines the how to inject all the dependencies from the **presentation** layer.