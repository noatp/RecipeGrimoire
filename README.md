# Recipe Grimoire

This is an iOS app that allows user to search for recipes that has a certain ingredient (ex: chicken, beef). The user can then bookmark these recipes for easy access later.

## Description

This app will use URLSession to send HTTP requests to [Food2Fork API](https://food2fork.ca). The API will response with recipes paginated into pages of 30 recipes each. The app will then use the pages to create an endless scroll experience for user by using Combine framework. The user can choose to bookmark any of the recipe and the recipe will be stored locally on the device using CoreData. UI is built with SwiftUI.

## Demo

![RecipeGrimoireDemo](/RecipeGrimoire/Demo/demo.gif)

<img src="/RecipeGrimoire/Demo/demo.gif" height="50%"/>

## Author

Toan Pham
