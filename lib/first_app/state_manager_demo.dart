import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StateManagerDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("状态管理示例页")),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SelfManagerWidget();
                  }));
                },
                child: Text("进入Widget管理自身状态示例页")),
            RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FatherManagerWidget();
                  }));
                },
                child: Text("进入父Widget管理子Widget状态示例页")),
            RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MixManagerWidget();
                  }));
                },
                child: Text("进入混合管理状态示例页"))
          ],
        ),
      ),
    );
  }
}

//----------自身管理状态-----start
class SelfManagerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("自身管理状态示例")),
      body: Center(
        child: TabBoxA(),
      ),
    );
  }
}

class TabBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TebBoxAState();
}

class TebBoxAState extends State<TabBoxA> {
  bool _active = false;

  _handleTop() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTop,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

//----------自身管理状态-----end

//-----------父Widget管理状态----start
class FatherManagerWidget extends StatefulWidget {
  @override
  State<FatherManagerWidget> createState() => FatherManagerState();
}

class FatherManagerState extends State<FatherManagerWidget> {
  bool _active = false;

  void handleTabBoxChanged(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("父Widget管理状态示例页")),
      ),
      body: Center(
        child: TabBoxB(
          active: _active,
          onChanged: handleTabBoxChanged,
        ),
      ),
    );
  }
}

class TabBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TabBoxB({Key key, this.active: false, @required this.onChanged});

  void _handleTop() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTop,
        child: Container(
          child: Center(
            child: Text(active ? "Active" : "Inactive",
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600]),
        ));
  }
}
//-----------父Widget管理状态----end

//-----------混合管理状态----end
class MixManagerWidget extends StatefulWidget {
  @override
  State<MixManagerWidget> createState() => MixManagerState();
}

class MixManagerState extends State<MixManagerWidget> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("混合管理示例页"),
      ),
      body: Center(
        child: TabBoxC(active: active, onChanged: _handleTap),
      ),
    );
  }

  void _handleTap(bool value) {
    setState(() {
      active = value;
    });
  }
}

class TabBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TabBoxC({Key key, this.active: false, @required this.onChanged});

  @override
  _TabBoxCState createState() => _TabBoxCState();
}

class _TabBoxCState extends State<TabBoxC> {
  bool _highlight = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        onTapDown: _handleTabDown,
        onTapUp: _handleTabUp,
        child: Container(
          child: Center(
            child: Text(
              widget.active ? "Active" : "InActive",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _highlight
                  ? new Border.all(color: Colors.teal[700], width: 10)
                  : null),
        ));
  }

  void _handleTap() {
    setState(() {
      widget.onChanged(!widget.active);
    });
  }

  void _handleTabUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTabDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }
}
