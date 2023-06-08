import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/subjects.dart';

class ReactiveTextField extends StatelessWidget {
  const ReactiveTextField({
    super.key,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.controller,
    this.focusNode,
    this.undoController,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.keyboardAppearance,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.contentInsertionConfiguration,
    this.restorationId,
    this.contextMenuBuilder,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.autofillHints = const <String>[],
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.stream,
    this.validator,
    required this.subject,
  });
  final BehaviorSubject<String> subject;
  final Stream<String>? stream;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final UndoHistoryController? undoController;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter = '•';
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final void Function(String value)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final MouseCursor? mouseCursor;
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Clip clipBehavior;
  final String? restorationId;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final bool canRequestFocus;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  @override
  Widget build(BuildContext context) {
    const errorColor = Colors.red;

    return StreamBuilder(
        stream: stream ?? subject.stream,
        builder: (context, snapshot) {
          final isError = snapshot.hasError;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                key: key,
                onChanged: onChanged,
                controller: controller,
                focusNode: focusNode,
                decoration: decoration,
                undoController: undoController,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                readOnly: readOnly,
                showCursor: showCursor,
                autofocus: autofocus,
                obscuringCharacter: obscuringCharacter,
                obscureText: obscureText,
                autocorrect: autocorrect,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                enableSuggestions: enableSuggestions,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                maxLengthEnforcement: maxLengthEnforcement,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                onAppPrivateCommand: onAppPrivateCommand,
                inputFormatters: inputFormatters,
                enabled: enabled,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorOpacityAnimates: cursorOpacityAnimates,
                cursorColor: cursorColor,
                keyboardAppearance: keyboardAppearance,
                scrollPadding: scrollPadding,
                dragStartBehavior: dragStartBehavior,
                enableInteractiveSelection: enableInteractiveSelection,
                selectionControls: selectionControls,
                onTap: onTap,
                onTapOutside: onTapOutside,
                mouseCursor: mouseCursor,
                buildCounter: buildCounter,
                scrollController: scrollController,
                scrollPhysics: scrollPhysics,
                autofillHints: autofillHints,
                contentInsertionConfiguration: contentInsertionConfiguration,
                clipBehavior: clipBehavior,
                restorationId: restorationId,
                contextMenuBuilder: contextMenuBuilder,
                spellCheckConfiguration: spellCheckConfiguration,
                magnifierConfiguration: magnifierConfiguration,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                canRequestFocus: canRequestFocus,
                scribbleEnabled: scribbleEnabled,
              ),
              isError
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: errorColor, fontSize: 12),
                      ),
                    )
                  : Container()
            ],
          );
        });
  }
}
