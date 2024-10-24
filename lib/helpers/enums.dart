
enum FlavorEnum {
  DEV,
  STAG,
  PROD
}

enum MethodEnum {
  GET,
  POST,
  PUT,
  DELETE
}

enum StatusTypeEnum {
  NONE,
  LOADING,
  COMPLETED,
  FAILED
}

enum TabItemEnum {
  HOME,
  CERT,
  PROFILE
}

enum SettingType {
  USERNAME,ABOUT,PHONE_NUMBER,PRIVACY,LANGUAGE,BACKUP,LOG_OUT
}

enum CallType{
  Calls,
  Missed
}

enum ChatType{
  Starred_Message,
  Chats,
  Schedule
}

enum MessageType{
  TEXT,SYSTEM,VIDEO_CALL,AUDIO_CALL
}

enum SystemType{
  REMOVE,INVITE,LEAVE,DEACTIVATED
}


extension MethodParseToString on MethodEnum {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension CallParseToString on CallType {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension ChatParseToString on ChatType {
  String toShortString() {
    return toString().split('.').last.replaceAll("_", " ");
  }
}

extension MessageParseToString on MessageType {
  String toShortString() {
    return toString().split('.').last.toUpperCase();
  }
}

extension SystemParseToString on SystemType {
  String toShortString() {
    return toString().split('.').last.toUpperCase();
  }
}
