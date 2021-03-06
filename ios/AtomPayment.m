#import "AtomPayment.h"
#import "AppDelegate.h"
@implementation AtomPayment
RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(goForAtomPayment:(NSDictionary *)details callback:(RCTResponseSenderBlock)callback)
{
  self.responseHandler = callback;
  [self openPaymentController:details];
}

-(void)openPaymentController:(NSDictionary *)details {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSAssert([details valueForKey:@"discriminator"], @"discriminator can not be nil");
    NSAssert([details valueForKey:@"merchantId"], @"merchantId can not be nil");
    NSAssert([details valueForKey:@"txnscamt"], @"txnscamt can not be nil");
    NSAssert([details valueForKey:@"loginid"], @"loginid can not be nil");
    NSAssert([details valueForKey:@"password"], @"password can not be nil");
    NSAssert([details valueForKey:@"txncurr"], @"txncurr can not be nil");
    NSAssert([details valueForKey:@"clientcode"], @"clientcode can not be nil");
    NSAssert([details valueForKey:@"custacc"], @"custacc can not be nil");
    NSAssert([details valueForKey:@"amt"], @"amt can not be nil");
    NSAssert([details valueForKey:@"txnid"], @"txnid can not be nil");
    NSAssert([details valueForKey:@"date"], @"date can not be nil");
    // NSAssert([details valueForKey:@"bankid"], @"bankid can not be nil");
    NSAssert([details valueForKey:@"signatureRequest"], @"signatureRequest can not be nil");
    NSAssert([details valueForKey:@"signatureResponse"], @"signatureResponse can not be nil");
    NSAssert([details valueForKey:@"prodid"], @"prodid can not be nil");
    NSAssert([details valueForKey:@"isLive"], @"isLive can not be nil");
    NSAssert([details valueForKey:@"ru"], @"ru can not be nil");
    nb *netB = [[nb alloc]init];
   // netB.discriminator = [details valueForKey:@"discriminator"] ;
    netB.myDelegate = self;
   netB.merchantId = [details valueForKey:@"merchantId"];
    netB.txnscamt =[details valueForKey:@"txnscamt"];
    netB.loginid = [details valueForKey:@"loginid"];
   netB.password = [details valueForKey:@"password"];
    netB.txncurr = [details valueForKey:@"txncurr"];
    netB.clientcode=[details valueForKey:@"clientcode"];
    netB.custacc=[details valueForKey:@"custacc"];
    netB.amt = [details valueForKey:@"amt"];
    netB.txnid = [details valueForKey:@"txnid"];
    netB.date = [details valueForKey:@"date"];
//    netB.bankid = [details valueForKey:@"bankid"];
    netB.reqHashKey = [details valueForKey:@"signatureRequest"];
    netB.resHashKey = [details valueForKey:@"signatureResponse"];
    netB.prodid = [details valueForKey:@"prodid"];
//   // netB.isLive = [[details valueForKey:@"isLive"] boolValue];
//    netB.ru = [details valueForKey:@"ru"];
////    if ([details valueForKey:@"customerName"]){
////      netB.udf1 = [details valueForKey:@"customerName"];
////    }
////    if ([details valueForKey:@"customerEmailID"]){
////      netB.udf2 = [details valueForKey:@"customerEmailID"];
////    }
////    if ([details valueForKey:@"customerMobileNo"]){
////      netB.udf3 = [details valueForKey:@"customerMobileNo"];
////    }
////    if ([details valueForKey:@"billingAddress"]){
////      netB.udf4 = [details valueForKey:@"billingAddress"];
////    }
////    if ([details valueForKey:@"optionalUdf9"]){
////      netB.udf4 = [details valueForKey:@"optionalUdf9"];
////    }
//
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    if (@available(iOS 13.0, *)) {
//      [netB setModalPresentationStyle: UIModalPresentationFullScreen];
//    }



    [delegate.window.rootViewController presentViewController:netB animated:YES completion:nil];
  });
}

- (void)secondviewcontrollerDissmissed:(NSMutableArray *)getResult {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSDictionary * response = @{@"result": @"OK", @"response": getResult};
         self.responseHandler(@[[NSNull null], response]);
  });
}

@end


// #import "AtomPayment.h"

// @implementation AtomPayment

// RCT_EXPORT_MODULE()

// // Example method
// // See // https://reactnative.dev/docs/native-modules-ios
// RCT_REMAP_METHOD(multiply,
//                  multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
//                  withResolver:(RCTPromiseResolveBlock)resolve
//                  withRejecter:(RCTPromiseRejectBlock)reject)
// {
//   NSNumber *result = @([a floatValue] * [b floatValue]);

//   resolve(result);
// }

// @end