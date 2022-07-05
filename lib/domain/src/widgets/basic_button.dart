import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:techx/domain/src/utilities.dart';

enum ButtonState {
  enabledUnpressed,
  enabledLoading,
  enabledSuccess,
  enabledFailure,
  disabled,
}

class BasicButton extends StatefulWidget {
  const BasicButton({
    Key? key,
    required this.color,
    this.enabled = true,
    required this.enabledText,
    required this.onTap,
    this.onAsyncTap,
    this.dynamicFeedback = false,
    this.filledIn = true,
    this.disabledText = "",
    this.minWidth = 150.0,
  }) : super(key: key);

  final MaterialColor color;
  final bool enabled;
  final bool filledIn;
  final String enabledText;
  final String disabledText;
  final void Function() onTap;
  final Future<void> Function()? onAsyncTap;
  final double minWidth;
  final bool dynamicFeedback;

  @override
  State<BasicButton> createState() => _BasicButtonState();
}

class _BasicButtonState extends State<BasicButton> {
  ButtonState _buttonState = ButtonState.enabledUnpressed;
  bool _debounce = true;
  String _errorMessage = "Ran into an error. Try again.";

  Widget _getButtonContent() {
    if (_buttonState == ButtonState.enabledLoading) {
      return LoadingIndicator(
        indicatorType: Indicator.pacman,
        strokeWidth: 20.0,
        colors: [widget.color],
      );
    } else if (_buttonState == ButtonState.enabledFailure) {
      return Text(
        _errorMessage,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.0,
        ),
      );
    } else if (_buttonState == ButtonState.enabledSuccess) {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 50.0,
      );
    } else {
      return Text(
        widget.enabled ? widget.enabledText : widget.disabledText,
        style: TextStyle(
          color: widget.filledIn ? Colors.white : widget.color,
          fontSize: 17.0,
        ),
      );
    }
  }

  LinearGradient _getButtonGradient() {
    if (widget.filledIn == true) {
      if (_buttonState == ButtonState.enabledUnpressed) {
        return LinearGradient(
          colors: [
            widget.color.shade800,
            widget.color.shade400,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        );
      } else if (_buttonState == ButtonState.enabledLoading) {
        return LinearGradient(
          colors: [
            widget.color.shade900,
            widget.color.shade600,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      } else if (_buttonState == ButtonState.enabledFailure) {
        return LinearGradient(
          colors: [
            Colors.red.shade800,
            Colors.red.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      } else if (_buttonState == ButtonState.enabledSuccess) {
        return LinearGradient(
          colors: [
            Colors.green.shade800,
            Colors.green.shade400,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        );
      } else if (_buttonState == ButtonState.disabled) {
        return LinearGradient(
          colors: [
            Colors.grey.shade900,
            Colors.grey.shade800,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      } else {
        return LinearGradient(
          colors: [
            widget.color.shade800,
            widget.color.shade400,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        );
      }
    } else {
      return LinearGradient(colors: [Colors.transparent, Colors.transparent]);
    }
  }

  Border _getButtonBorder() {
    if (widget.filledIn == false) {
      return Border.all(
        color: widget.color,
        style: BorderStyle.solid,
        width: 1.0,
      );
    } else {
      return Border.all(width: 0.0);
    }
  }

  @override
  void initState() {
    _buttonState =
        widget.enabled ? ButtonState.enabledUnpressed : ButtonState.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enabled == false) {
      _buttonState = ButtonState.disabled;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 750),
      height: 60.0,
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: widget.color.withOpacity(0.15),
            spreadRadius: -12.0,
            blurRadius: 24.0,
          ),
        ],
        border: _getButtonBorder(),
        gradient: _getButtonGradient(),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: RawMaterialButton(
        onPressed: () async {
          if (_debounce == true && widget.enabled == true) {
            VibrateUtility.vibrate();
            _debounce = false;
            bool processSuccess = true;
            if (mounted == true) {
              setState(() {
                _buttonState = ButtonState.enabledLoading;
              });
            }
            try {
              if (widget.onAsyncTap != null) {
                await widget.onAsyncTap!();
              } else {
                widget.onTap();
              }
            } catch (e) {
              _errorMessage = e.toString();
              print(_errorMessage);
              if (_errorMessage.startsWith("Exception: ")) {
                _errorMessage =
                    _errorMessage.substring(11, _errorMessage.length);
              }
              if (_errorMessage.length > 34) {
                _errorMessage = _errorMessage.substring(0, 34) + "...";
              }
              processSuccess = false;
            }
            if (mounted) {
              await Future.delayed(
                  const Duration(seconds: 1, milliseconds: 500));
            }
            if (widget.dynamicFeedback) {
              if (processSuccess == true) {
                if (mounted == true) {
                  setState(() {
                    VibrateUtility.vibrate();
                    _buttonState = ButtonState.enabledSuccess;
                  });
                }
              } else {
                if (mounted == true) {
                  setState(() {
                    VibrateUtility.vibrate();
                    _buttonState = ButtonState.enabledFailure;
                  });
                }
              }
              if (mounted) {
                await Future.delayed(const Duration(seconds: 4));
              }
            }
            if (mounted == true) {
              setState(() {
                _buttonState = ButtonState.enabledUnpressed;
              });
            }
            _debounce = true;
          }
        },
        child: _getButtonContent(),
      ),
    );
  }
}
