import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

const Color chatwootColorPrimary =
    Color(0xff1f93ff); // Lowercase para constantes
const Color chatwootBgColor = Color(0xfff4f6fb);
const List<Color> chatwootAvatarColors = [chatwootColorPrimary];

/// Custom Chatwoot chat theme that extends [ChatTheme].
///
/// This theme provides default styling matching Chatwoot's design system.
/// All parameters are optional and can be overridden individually.
@immutable
class ChatwootChatTheme extends ChatTheme {
  /// Creates a Chatwoot chat theme.
  ///
  /// Use this constructor to customize specific theme attributes while
  /// maintaining Chatwoot's default styling for others.
  const ChatwootChatTheme(
      {super.attachmentButtonIcon,
      super.backgroundColor = chatwootBgColor,
      super.dateDividerTextStyle = const TextStyle(
        color: Colors.black26,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
      super.deliveredIcon,
      super.documentIcon,
      super.emptyChatPlaceholderTextStyle = const TextStyle(
        color: Colors.black54, // Replaced NEUTRAL_2 with concrete color
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      super.errorColor = Colors.red, // Replaced ERROR with concrete color
      super.errorIcon,
      super.inputBackgroundColor = Colors.white,
      super.inputBorderRadius = const BorderRadius.all(
        Radius.circular(10),
      ),
      super.inputTextColor = Colors.black87,
      super.inputTextStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      super.messageBorderRadius = 20.0,
      super.primaryColor = chatwootColorPrimary,
      super.receivedMessageBodyTextStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      super.receivedMessageCaptionTextStyle = const TextStyle(
        color: Colors.black54, // Replaced NEUTRAL_2
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.333,
      ),
      super.receivedMessageDocumentIconColor =
          chatwootColorPrimary, // Replaced PRIMARY
      super.receivedMessageLinkDescriptionTextStyle = const TextStyle(
        color: Colors.black, // Replaced NEUTRAL_0
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.428,
      ),
      super.receivedMessageLinkTitleTextStyle = const TextStyle(
        color: Colors.black, // Replaced NEUTRAL_0
        fontSize: 16,
        fontWeight: FontWeight.w800,
        height: 1.375,
      ),
      super.secondaryColor = Colors.white,
      super.seenIcon,
      super.sendButtonIcon,
      super.sendingIcon,
      super.sentMessageBodyTextStyle = const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      super.sentMessageCaptionTextStyle = const TextStyle(
        color: Colors.white70, // Replaced NEUTRAL_7_WITH_OPACITY
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.333,
      ),
      super.sentMessageDocumentIconColor = Colors.white, // Replaced NEUTRAL_7
      super.sentMessageLinkDescriptionTextStyle = const TextStyle(
        color: Colors.white, // Replaced NEUTRAL_7
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.428,
      ),
      super.sentMessageLinkTitleTextStyle = const TextStyle(
        color: Colors.white, // Replaced NEUTRAL_7
        fontSize: 16,
        fontWeight: FontWeight.w800,
        height: 1.375,
      ),
      super.userAvatarNameColors = chatwootAvatarColors,
      super.userAvatarTextStyle = const TextStyle(
        color: Colors.white, // Replaced NEUTRAL_7
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
      super.userNameTextStyle = const TextStyle(
        color: Colors.black87,
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
      required super.attachmentButtonMargin,
      required super.dateDividerMargin,
      required super.inputSurfaceTintColor,
      required super.inputElevation,
      required super.inputMargin,
      required super.inputPadding,
      required super.inputTextDecoration,
      required super.messageInsetsHorizontal,
      required super.messageInsetsVertical,
      required super.messageMaxWidth,
      required super.receivedEmojiMessageTextStyle,
      required super.sendButtonMargin,
      required super.sentEmojiMessageTextStyle,
      required super.statusIconPadding,
      required super.systemMessageTheme,
      required super.typingIndicatorTheme,
      required super.unreadHeaderTheme,
      required super.userAvatarImageBackgroundColor});
}
