import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Artboard? _artboard;
  late RiveAnimationController idle;
  late RiveAnimationController handsDown;
  late RiveAnimationController handsUp;
  late RiveAnimationController success;
  late RiveAnimationController fail;
  late RiveAnimationController lookDownLeft;
  late RiveAnimationController lookDownRight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idle = SimpleAnimation((Animated.idle.name));
    handsDown = SimpleAnimation((Animated.hands_down.name));
    handsUp = SimpleAnimation((Animated.Hands_up.name));
    success = SimpleAnimation((Animated.success.name));
    fail = SimpleAnimation((Animated.fail.name));
    lookDownLeft = SimpleAnimation((Animated.Look_down_right.name));
    lookDownRight = SimpleAnimation((Animated.Look_down_left.name));
    rootBundle.load("assests/login.riv").then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      setState(() {
        _artboard = artboard;
        _artboard!.artboard.addController(idle);
      });
    });

    pwd.addListener(onfocus);
  }

  FocusNode pwd = FocusNode();

  void onfocus() {
    if (pwd.hasFocus) {
      addcont(handsUp);
    } else {
      addcont(handsDown);
    }
  }

  void removeallcont() {
    _artboard!.artboard.removeController(idle);
    _artboard!.artboard.removeController(handsUp);
    _artboard!.artboard.removeController(handsDown);
    _artboard!.artboard.removeController(success);
    _artboard!.artboard.removeController(fail);
    _artboard!.artboard.removeController(lookDownRight);
    _artboard!.artboard.removeController(lookDownLeft);
    _artboard!.artboard.addController(idle);
    lookleft=lookright=false;
  }

  void addcont(RiveAnimationController x) {

    lookright = (x == lookDownRight) ? true : lookright;
    lookleft = (x == lookDownLeft) ? true : lookleft;
    removeallcont();
    _artboard!.artboard.addController(x);

  }

  bool lookright = false;
  bool lookleft = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Center(child: Text("MASROUFEK")),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          FittedBox(
              child: Icon(
            Icons.lock,
            size: 400,
            color: Colors.grey,
          )),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    height: 200,
                    child: (_artboard == null)
                        ? SizedBox()
                        : Rive(
                            artboard: _artboard!,
                          ),
                  ),

                  //Icon(Icons.lock,size: 115,color: Colors.grey.shade700,),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      maxLines: 1,maxLength: 50,
                      onChanged: (value) {
                           setState((){
                          if (value.isNotEmpty&& value.length < 20 && !lookright) {
                            addcont(lookDownRight);
                          } else if (value.isNotEmpty&&
                              value.length >= 20 &&
                              !lookleft) {
                            addcont(lookDownLeft);
                          }else {
                            addcont(idle);
                          }

                        });
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "UserName",
                          hintStyle: TextStyle(color: Colors.grey[500])),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(maxLength: 10,maxLines: 1,
                      focusNode: pwd,
                      onChanged: (text) {
                        if (!pwd.hasFocus) {
                          addcont(handsDown);
                        }
                      },
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[500])),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // sign in button
                  ElevatedButton(
                    onPressed: () {
                      addcont(success);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assests/images/google.png",
                          height: 35,
                        ),
                      ),

                      const SizedBox(width: 25),

                      // apple button
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          //fit: BoxFit.cover,
                          "assests/images/fb.png",
                          height: 35,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
enum Animated {
  idle,
  Hands_up,
  hands_down,
  success,
  fail,
  Look_down_right,
  Look_down_left
}
