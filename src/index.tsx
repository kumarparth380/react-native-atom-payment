import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-atom-payment' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const AtomPayment = NativeModules.AtomPayment
  ? NativeModules.AtomPayment
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function confirmPayment(
  transactionDetail: any,
  callback: Function
): Promise<number> {
  return AtomPayment.goForAtomPayment(transactionDetail, callback);
}

export default AtomPayment;
