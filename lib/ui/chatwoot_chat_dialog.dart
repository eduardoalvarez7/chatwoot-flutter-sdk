import 'package:chatwoot_sdk/data/local/entity/chatwoot_user.dart';
import 'package:chatwoot_sdk/ui/chatwoot_chat_theme.dart';
import 'package:chatwoot_sdk/ui/chatwoot_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/intl.dart';

import 'chatwoot_chat_page.dart';

///Chatwoot chat modal widget
/// {@category FlutterClientSdk}
@deprecated
class ChatwootChatDialog extends StatefulWidget {
  static show(
    BuildContext context, {
    required String baseUrl,
    required String inboxIdentifier,
    bool enablePersistence = true,
    required String title,
    ChatwootUser? user,
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    ChatwootL10n? l10n,
    DateFormat? timeFormat,
    DateFormat? dateFormat,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return ChatwootChatDialog(
            baseUrl: baseUrl,
            inboxIdentifier: inboxIdentifier,
            title: title,
            user: user,
            enablePersistence: enablePersistence,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            backgroundColor: backgroundColor,
            l10n: l10n,
            timeFormat: timeFormat,
            dateFormat: dateFormat,
          );
        });
  }

  ///Installation url for chatwoot
  final String baseUrl;

  ///Identifier for target chatwoot inbox.
  ///
  /// For more details see https://www.chatwoot.com/docs/product/channels/api/client-apis
  final String inboxIdentifier;

  /// Enables persistence of chatwoot client instance's contact, conversation and messages to disk
  /// for convenience.
  ///
  /// Setting [enablePersistence] to false holds chatwoot client instance's data in memory and is cleared as
  /// soon as chatwoot client instance is disposed
  final bool enablePersistence;

  /// Custom user details to be attached to chatwoot contact
  final ChatwootUser? user;

  /// Primary color for [ChatwootChatTheme]
  final Color? primaryColor;

  /// Secondary color for [ChatwootChatTheme]
  final Color? secondaryColor;

  /// Secondary color for [ChatwootChatTheme]
  final Color? backgroundColor;

  /// See [ChatwootL10n]
  final String title;

  /// See [ChatwootL10n]
  final ChatwootL10n? l10n;

  /// See [Chat.timeFormat]
  final DateFormat? timeFormat;

  /// See [Chat.dateFormat]
  final DateFormat? dateFormat;

  const ChatwootChatDialog({
    Key? key,
    required this.baseUrl,
    required this.inboxIdentifier,
    this.enablePersistence = true,
    required this.title,
    this.user,
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.l10n,
    this.timeFormat,
    this.dateFormat,
  }) : super(key: key);

  @override
  _ChatwootChatDialogState createState() => _ChatwootChatDialogState();
}

@deprecated
class _ChatwootChatDialogState extends State<ChatwootChatDialog> {
  late String status;
  late ChatwootL10n localizedStrings;

  @override
  void initState() {
    super.initState();
    this.localizedStrings = widget.l10n ?? ChatwootL10n();
    this.status = localizedStrings.offlineText;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Visibility(
                            visible: status != localizedStrings.offlineText,
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          status,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Flexible(
              child: ChatwootChat(
                baseUrl: widget.baseUrl,
                inboxIdentifier: widget.inboxIdentifier,
                user: widget.user,
                enablePersistence: widget.enablePersistence,
                timeFormat: widget.timeFormat,
                dateFormat: widget.dateFormat,
                theme: ChatwootChatTheme(
                  primaryColor: widget.primaryColor ?? chatwootColorPrimary,
                  secondaryColor: widget.secondaryColor ?? Colors.white,
                  backgroundColor: widget.backgroundColor ?? chatwootBgColor,
                  userAvatarNameColors: [
                    widget.primaryColor ?? chatwootColorPrimary
                  ],

                  // Configuración básica
                  attachmentButtonMargin: const EdgeInsets.only(right: 16),
                  dateDividerMargin: const EdgeInsets.symmetric(vertical: 24),
                  inputSurfaceTintColor: Colors.transparent,
                  inputElevation: 0.0,
                  inputMargin: const EdgeInsets.all(16),
                  inputPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  inputTextDecoration:
                      const InputDecoration(border: InputBorder.none),

                  // Mensajes
                  messageInsetsHorizontal: 16.0,
                  messageInsetsVertical: 8.0,
                  messageMaxWidth: 280.0,

                  // Emojis
                  receivedEmojiMessageTextStyle: const TextStyle(fontSize: 40),
                  sentEmojiMessageTextStyle: const TextStyle(fontSize: 40),

                  // Botones
                  sendButtonMargin: const EdgeInsets.only(left: 16),
                  statusIconPadding: const EdgeInsets.all(4),

                  // Typing Indicator (completo con todos los parámetros)
                  typingIndicatorTheme: TypingIndicatorTheme(
                    animatedCirclesColor:
                        widget.primaryColor ?? chatwootColorPrimary,
                    bubbleBorder: BorderRadius.circular(12),
                    bubbleColor:
                        Color(0xFFE0E0E0), // Equivalente a Colors.grey[200]
                    countAvatarColor:
                        Color(0xFFEEEEEE), // Equivalente a Colors.grey[300]
                    animatedCircleSize: 8.0,
                    countTextColor: Colors.black87,
                    multipleUserTextStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),

                  // Avatar
                  userAvatarImageBackgroundColor:
                      Color(0xFFE0E0E0), // Colors.grey[200]

                  // System Message
                  systemMessageTheme: SystemMessageTheme(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    textStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Unread Header
                  unreadHeaderTheme: UnreadHeaderTheme(
                    color: (widget.primaryColor ?? chatwootColorPrimary)
                        .withOpacity(0.1),
                    textStyle: TextStyle(
                      color: widget.primaryColor ?? chatwootColorPrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
                isPresentedInDialog: true,
                onConversationIsOffline: () {
                  setState(() {
                    status = localizedStrings.offlineText;
                  });
                },
                onConversationIsOnline: () {
                  setState(() {
                    status = localizedStrings.onlineText;
                  });
                },
                onConversationStoppedTyping: () {
                  setState(() {
                    if (status == localizedStrings.typingText) {
                      status = localizedStrings.onlineText;
                    }
                  });
                },
                onConversationStartedTyping: () {
                  setState(() {
                    status = localizedStrings.typingText;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
