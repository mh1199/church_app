// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import 'package:dio/dio.dart';
// import 'package:provider/provider.dart';
//
// import '../configs/routes_handler.dart';
// import '../models/api_response.dart';
// import '/helpers/constants.dart';
// import '/helpers/utils.dart';
//
// import '/configs/locator.dart';
//
// import '/stores/global_state.dart';
//
// import 'navigation_service.dart';
// import 'network_service.dart';
//
// abstract class RestService {
//   Future httpLogout();
//   Future httpSignIn();
//   Future httpUpdateProfile();
//   Future httpGetUserByPhone();
//   Future httpChangePhoneNumber();
//   Future httpValidateOtp();
//   Future httpRequestOtp();
//   Future httpCreateImage();
//   Future httpCreateImageLarge();
//   Future httpGetImage();
//   Future httpThreadList();
//   Future httpThreadMute();
//   Future httpThreadUnmute();
//   Future httpThreadBlock();
//   Future httpThreadUnblock();
//   Future httpCreateMessage();
//   Future httpUpdateMessage();
//   Future httpMessageList();
//   Future httpMessageRead();
//   Future httpMessageReceive();
//   Future httpMessageDelete();
//   Future httpContactImport();
//   Future httpContactList();
//   Future httpScheduledCreate();
//   Future httpScheduledUpdate();
//   Future httpScheduledDelete();
//   Future httpScheduledList();
//   Future httpGroupCreate();
//   Future httpGroupUpdate();
//   Future httpGroupDelete();
//   Future httpGroupList();
//   Future httpGroupInvite();
//   Future httpGroupLeave();
//   Future httpGroupUserUpdateAdmin();
//   Future httpGroupUserRemove();
//   // Future httpSignUp();
// }
//
//
// class RestServiceImpl implements RestService {
//   final globalState = Provider.of<GlobalState>(
//       locator<NavigationService>().context(),
//       listen: false);
//
//   @override
//   Future httpLogout() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_LOGOUT,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: "",
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(
//               errorMsg, httpLogout, Constants.URL_LOGOUT, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpLogout response : $response');
//     return response;
//   }
//
//   @override
//   Future httpSignIn() async {
//     globalState.show();
//
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//         Constants.URL_SIGNIN,
//         '',
//             (response) {
//           globalState.dismiss();
//         },
//         params: globalState.signInParams,
//         errorCallBack: (errorMsg) {
//           globalState.dismiss();
//           print('error : $errorMsg');
//           if (errorMsg is DioError) {
//             locator<NetworkServiceImpl>().onDioError(errorMsg, httpSignIn,
//                 Constants.URL_SIGNIN, '', '', emptyFunc);
//           }
//         })
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('signin response : $response');
//     return response;
//   }
//
//   @override
//   Future httpUpdateProfile() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_UPDATE_PROFILE,
//       '',
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.updateProfileParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpUpdateProfile,
//               Constants.URL_UPDATE_PROFILE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('update profile response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGetUserByPhone() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GET_USER_BY_PHONE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.getUserByPhoneParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGetUserByPhone,
//               Constants.URL_GET_USER_BY_PHONE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('getUserByPhone response : $response');
//     return response;
//   }
//
//   @override
//   Future httpChangePhoneNumber() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_CHANGE_PHONE_NUMBER,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.changePhoneNumberParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpChangePhoneNumber,
//               Constants.URL_CHANGE_PHONE_NUMBER, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('changePhoneNumber response : $response');
//     return response;
//   }
//
//   @override
//   Future httpValidateOtp() async {
//     globalState.show();
//     await Future.delayed(Duration(milliseconds: 100));
//     const url = Constants.URL_OTP_CHECK;
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       url,
//       '',
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.validateOtpParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : ' + errorMsg.toString());
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>()
//               .onDioError(errorMsg, httpValidateOtp, url, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('val otp response : $response');
//     return response;
//   }
//
//   @override
//   Future httpRequestOtp() async {
//     globalState.show();
//     await Future.delayed(Duration(milliseconds: 100));
//     const url = Constants.URL_OTP_REQUEST;
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       url,
//       '',
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.requestOtpParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : ' + errorMsg.toString());
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>()
//               .onDioError(errorMsg, httpRequestOtp, url, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('req otp response : $response');
//     return response;
//   }
//
//   @override
//   Future httpCreateImage() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_UPLOAD_IMAGE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.createImageParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpCreateImage,
//               Constants.URL_UPLOAD_IMAGE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpCreateImage response : $response');
//     return response;
//   }
//
//   @override
//   Future httpCreateImageLarge() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_UPLOAD_IMAGE_LARGE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.createImageLargeParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpCreateImageLarge,
//               Constants.URL_UPLOAD_IMAGE_LARGE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpCreateImageLarge response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGetImage() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GET_IMAGE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.getImageParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGetImage,
//               Constants.URL_GET_IMAGE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGetImage response : $response');
//     return response;
//   }
//
//   @override
//   Future httpThreadList() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_THREAD_LIST,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.threadListParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpThreadList,
//               Constants.URL_THREAD_LIST, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpThreadList response : $response');
//     return response;
//   }
//
//   @override
//   Future httpThreadMute() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_THREAD_MUTE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.threadMuteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpThreadMute,
//               Constants.URL_THREAD_MUTE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpThreadMute response : $response');
//     return response;
//   }
//
//   @override
//   Future httpThreadUnmute() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_THREAD_UNMUTE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.threadUnmuteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpThreadUnmute,
//               Constants.URL_THREAD_UNMUTE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpThreadUnmute response : $response');
//     return response;
//   }
//
//   @override
//   Future httpThreadBlock() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_THREAD_BLOCK,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.threadBlockParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpThreadBlock,
//               Constants.URL_THREAD_BLOCK, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpThreadBlock response : $response');
//     return response;
//   }
//
//   @override
//   Future httpThreadUnblock() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_THREAD_UNBLOCK,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.threadUnblockParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpThreadUnblock,
//               Constants.URL_THREAD_UNBLOCK, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpThreadUnblock response : $response');
//     return response;
//   }
//
//   @override
//   Future httpCreateMessage() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_CREATE_MESSAGE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.createMessageParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpCreateMessage,
//               Constants.URL_CREATE_MESSAGE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpCreateMessage response : $response');
//     return response;
//   }
//
//   @override
//   Future httpUpdateMessage() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_UPDATE_MESSAGE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.updateMessageParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpUpdateMessage,
//               Constants.URL_UPDATE_MESSAGE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpUpdateMessage response : $response');
//     return response;
//   }
//
//   @override
//   Future httpMessageList() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_MESSAGE_LIST,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.messageListParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpMessageList,
//               Constants.URL_MESSAGE_LIST, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpMessageList response : $response');
//     return response;
//   }
//
//   @override
//   Future httpMessageRead() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_MESSAGE_READ,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.messageReadParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpMessageRead,
//               Constants.URL_MESSAGE_READ, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpMessageRead response : $response');
//     return response;
//   }
//
//   @override
//   Future httpMessageReceive() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_MESSAGE_RECEIVE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.messageReceiveParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpMessageReceive,
//               Constants.URL_MESSAGE_RECEIVE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpMessageReceive response : $response');
//     return response;
//   }
//
//   @override
//   Future httpMessageDelete() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_MESSAGE_DELETE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.messageDeleteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpMessageDelete,
//               Constants.URL_MESSAGE_DELETE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpMessageDelete response : $response');
//     return response;
//   }
//
//   @override
//   Future httpContactImport() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_CONTACT_IMPORT,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.contactImportParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpContactImport,
//               Constants.URL_CONTACT_IMPORT, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpContactImport response : $response');
//     return response;
//   }
//
//   @override
//   Future httpContactList() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_CONTACT_LIST,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.contactListParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpContactList,
//               Constants.URL_CONTACT_LIST, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpContactList response : $response');
//     return response;
//   }
//
//   @override
//   Future httpScheduledCreate() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_SCHEDULED_CREATE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.scheduledCreateParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpScheduledCreate,
//               Constants.URL_SCHEDULED_CREATE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpScheduledCreate response : $response');
//     return response;
//   }
//
//   @override
//   Future httpScheduledUpdate() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_SCHEDULED_UPDATE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.scheduledUpdateParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpScheduledUpdate,
//               Constants.URL_SCHEDULED_UPDATE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpScheduledUpdate response : $response');
//     return response;
//   }
//
//   @override
//   Future httpScheduledDelete() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_SCHEDULED_DELETE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.scheduledDeleteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpScheduledDelete,
//               Constants.URL_SCHEDULED_DELETE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpScheduledDelete response : $response');
//     return response;
//   }
//
//   @override
//   Future httpScheduledList() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_SCHEDULED_LIST,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.scheduledListParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpScheduledList,
//               Constants.URL_SCHEDULED_LIST, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpScheduledList response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupCreate() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_CREATE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupCreateParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupCreate,
//               Constants.URL_GROUP_CREATE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupCreate response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupUpdate() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_UPDATE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupUpdateParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupUpdate,
//               Constants.URL_GROUP_UPDATE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupUpdate response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupDelete() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_DELETE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupDeleteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupDelete,
//               Constants.URL_GROUP_DELETE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupDelete response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupList() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_LIST,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupListParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupList,
//               Constants.URL_GROUP_LIST, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupList response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupInvite() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_INVITE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupInviteParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupInvite,
//               Constants.URL_GROUP_INVITE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupInvite response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupLeave() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUP_LEAVE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupLeaveParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupLeave,
//               Constants.URL_GROUP_LEAVE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupLeave response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupUserUpdateAdmin() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUPUSER_UPDATEADMIN,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupuserUpdateAdminParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupUserUpdateAdmin,
//               Constants.URL_GROUPUSER_UPDATEADMIN, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupUserUpdateAdmin response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGroupUserRemove() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_GROUPUSER_REMOVE,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.groupuserRemoveParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGroupUserRemove,
//               Constants.URL_GROUPUSER_REMOVE, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('httpGroupUserRemove response : $response');
//     return response;
//   }
//
//   @override
//   Future httpGetTextType() async {
//     globalState.show();
//     final response = await locator<NetworkServiceImpl>()
//         .post(
//       Constants.URL_TEXTTYPE_GET,
//       true,
//           (response) {
//         globalState.dismiss();
//       },
//       params: globalState.getTextTypeParams,
//       errorCallBack: (errorMsg) {
//         globalState.dismiss();
//         print('error : $errorMsg');
//         if (errorMsg is DioError) {
//           locator<NetworkServiceImpl>().onDioError(errorMsg, httpGetTextType,
//               Constants.URL_TEXTTYPE_GET, '', '', emptyFunc);
//         }
//       },
//     )
//         .catchError((err) {
//       globalState.dismiss();
//     });
//     print('getTextType response : $response');
//     return response;
//   }
//
//
// }
