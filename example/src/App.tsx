//@ts-nocheck
import * as React from 'react';

import { StyleSheet, View, Text, Button } from 'react-native';
import AtomPayment, { confirmPayment } from 'react-native-atom-payment';

const onPressPayNow = () => {
  console.log('AtomPay ', AtomPayment);
  let netB = {
    discriminator: 'All',
    merchantId: '197',
    txnscamt: '0.0',
    loginid: '197',
    password: 'Test@123',
    txncurr: 'INR',
    clientcode: '007',
    custacc: '100000036600',
    amt: '100.00',
    txnid: '015',
    date: '23/08/2019 11:57:00',
    bankid: '2001',
    signatureRequest: 'KEY123657234',
    signatureResponse: 'KEYRESP123657234',
    prodid: 'NSE',
    isLive: false,
    ru: 'https://paynetzuat.atomtech.in/mobilesdk/param',
    channelid: 'INT',
  };

  // Below are the optional values
  netB.customerName = 'ABC';
  netB.customerEmailID = 'abc@gmail.com';
  netB.customerMobileNo = '5555555555';
  netB.billingAddress = 'Pune';
  netB.optionalUdf9 = 'Chetan';
  confirmPayment(netB, (error, response) => {
    console.log('error ', error, response);
    if (error) {
      // handle transaction error
      console.error(error);
    } else {
      // handle transaction success
      console.log('response', response);
    }
  });
};

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.welcome}>☆AtomPayment example☆</Text>
      <Text style={styles.instructions}>STATUS: loaded</Text>
      <Text style={styles.welcome}>☆☆☆</Text>
      <Button title="Pay Now" onPress={onPressPayNow} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
