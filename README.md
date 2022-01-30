# react-native-atom-payment

React Native library for atom payments

## Installation

```sh
yarn add react-native-atom-payment
or
npm install react-native-atom-payment
```

### Requirements

#### Android

Android 5.0 (API level 21) and above

#### iOS

Compatible with apps targeting iOS 11 or above.

You'll need to run `pod install` in your `ios` directory to install the native dependencies.

## Usage

```tsx
// PaymentScreen.ts
import { confirmPayment } from "react-native-atom-payment";

// ...

confirmPayment(txDetails, (error, response)=> {
    // success/failure handler
});
```

## Run the example app

- Install the dependencies
  - `yarn bootstrap`
- Start the example
  - Terminal 1: `yarn example start`
  - Terminal 2: depending on what platform you want to build for run either
    - `yarn example ios`
    - or
    - `yarn example android`

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
