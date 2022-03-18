import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_create.dart';
import 'package:dart_flutter_example/screens/customer/customer_create_screen.dart';
import 'package:dart_flutter_example/screens/invoice/invoice_create_screen.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({Key? key}) : super(key: key);

  @override
  FloatingButtonState createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton>
    with SingleTickerProviderStateMixin {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
        fabButtons: <Widget>[
          this._client(),
          this._invoice(),
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close //To principal button
        );
  }

  Widget _client() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btnClient",
        tooltip: 'Crear clientes.',
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.pushNamed(context, CreateCustomerScreen.routeName,
              arguments: ReloadCustomerCreate.HOME_STRATEGY);
        },
      ),
    );
  }

  Widget _invoice() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btnInvoice",
        tooltip: 'Crear facturas.',
        child: Icon(Icons.business),
        onPressed: () {
          Navigator.pushNamed(context, CreateInvoiceScreen.routeName);
        },
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
  }
}


class AnimatedFloatingActionButton extends StatefulWidget {
  final List<Widget> fabButtons;
  final Color colorStartAnimation;
  final Color colorEndAnimation;
  final AnimatedIconData animatedIconData;

  const AnimatedFloatingActionButton(
      {Key? key,
        required this.fabButtons,
        required this.colorStartAnimation,
        required this.colorEndAnimation,
        required this.animatedIconData})
      : super(key: key);

  @override
  _AnimatedFloatingActionButtonState createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;

  bool isOpened = false;

  @override
  void initState() {
    super.initState();

    //controller
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    //change color
    _buttonColor = ColorTween(
      begin: widget.colorStartAnimation,
      end: widget.colorEndAnimation,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));

    //animate icon
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    //animate floating button
    _translateButton = Tween<double>(
      begin: 56.0,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.75,
        curve: Curves.easeOut,
      ),
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget getToggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: widget.animatedIconData,
        progress: _animateIcon,
        color: Colors.white,
      ),
    );
  }

  List<Widget> _setFabButtons() {
    List<Widget> processButtons = [];

    for (int i = 0; i < widget.fabButtons.length; i++) {
      processButtons.add(TransformFloatButton(
        floatButton: widget.fabButtons[i],
        translateValue: _translateButton.value * (widget.fabButtons.length - i),
      ));
    }
    processButtons.add(getToggle());
    return processButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: _setFabButtons(),
    );
  }
}

class TransformFloatButton extends StatelessWidget {
  final Widget floatButton;
  final double translateValue;

  TransformFloatButton(
      {required this.floatButton, required this.translateValue})
      : super(key: ObjectKey(floatButton));

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
        0.0,
        translateValue,
        0.0,
      ),
      child: floatButton,
    );
  }
}
