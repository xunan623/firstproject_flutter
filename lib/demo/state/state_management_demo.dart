import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  // StatelessWidget不能修改的类 必须用final
  int count = 0; // 因为变量必须不能更改 所以会出现提示

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(label: Text('$count')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count += 1;
          print('$count');
        },
      ),
    );
  }
}

class StateManagement1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(), // 传值
        floatingActionButton: ScopedModelDescendant<CounterModel>(
            builder: (context, _, model) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: model.increaseCount,
                )),
      ),
    );
  }
}

// 第二级
class CounterWrapper extends StatelessWidget {
  // 传值问题 正向传值
  final int count;

  // 逆向传值回调
  final VoidCallback increaseCount;

  // 构造函数
  CounterWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count, increaseCount),
    );
  }
}

// 第二级1
class CounterWrapper1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter1(),
    );
  }
}

// 第三级
class Counter extends StatelessWidget {
  // 传值问题 正向传值
  final int count;

  // 逆向传值回调
  final VoidCallback increaseCount;

  // 构造函数
  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// 第三级1
class Counter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// 直接创建一个widget用来存数据
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  // 获取state里的数据
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  // 通知是否继承了通知
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
