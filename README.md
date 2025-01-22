# ![CryptoChallenge Logo](CryptoChallengeLogo.png)
# CryptoChallenge App

An iOS application designed to provide updated cryptocurrency data, with a focus on local persistence, caching, and user experience.

---

## Features

### Core Features
- **Network Monitor**  
  Detects changes in network connectivity and lays the groundwork for offline handling.

- **Pull to Refresh**  
  Pull-to-refresh functionality for data updates.

- **Caching and Local Persistence with SwiftData**  
  SwiftData ensures efficient data storage and retrieval, enabling offline access.

- **MVVM Architecture**  
  Clean and maintainable app structure for UI and business logic separation.

- **Real-Time Cryptocurrency Data**  
  Fetches data for 20 cryptocurrencies from the CoinGecko API.

- **Mesh Gradients (iOS 18)**  
  Incorporates Apple's new mesh gradients available from iOS 18 for a modern and engaging user interface.

---

## Demo

![CryptoTracker Demo](https://via.placeholder.com/1024x768)  
*Demo showcasing the app's features and flow.*

### Demo Flow
1. Navigate through the entire app.
2. Display the list of 20 coins and explore the tabs.
   - In the Favorites tab, if no favorites are available, a placeholder description is shown.
3. Utilize the search functionality.
4. Access the details of a coin, view its overview and details, and demonstrate the animation when adding it to favorites.
   - Update the list of coins to reflect the newly added favorite.
   - Use the pull-to-refresh feature, showcasing the updated "last updated" date.
5. Disconnect from the internet and show how the app retains data for offline access.
   - Attempt to update while offline, and demonstrate how the app synchronizes seamlessly when reconnected.

---

## Branch Management

Development workflow follows the following structure:

1. **Main**  
   The production-ready branch. Code is merged here only after testing.

2. **Development**  
   The integration branch for features. Pull requests from individual feature branches are merged into development.

3. **Feature Branches**  
   Each new feature is developed in its own branch.  
   Examples:
   - `feature/navigation-and-models`
   - `feature/api-wifi-services`

4. **Pull Requests**  
   - Feature branches -> Development
   - Development -> Main
