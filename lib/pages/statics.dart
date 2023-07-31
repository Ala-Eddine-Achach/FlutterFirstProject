import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projecttest/expenses/widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../expenses/list.dart';

class ExpenseContainer extends StatefulWidget {
  ExpenseContainer({super.key});

  @override
  State<ExpenseContainer> createState() => _ExpenseContainerState();
}

class _ExpenseContainerState extends State<ExpenseContainer> {
  final sal = Salary;

  double getSumOfAmounts(List<Map<String, dynamic>> exp_list,
      {String cat = "all"}) {
    double sum_of_amounts = 0.0;
    for (Map<String, dynamic> exp in exp_list) {
      if ((cat == "all") ? true : exp["category"] == cat)
        sum_of_amounts += exp["amount"];
    }
    return sum_of_amounts;
  }

  get spent => getSumOfAmounts(exp_list);

  ScrollController controller = ScrollController();

  double topContainer = 0;
  double scale=1;
  @override
  void initState() {
    controller.addListener(() {



      setState(() {
        topContainer =(controller.offset/180) ;
        scale=(topContainer<1)?((topContainer>0)?1-topContainer:1):0;});});
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller:controller ,
        physics: const BouncingScrollPhysics(),
        children: [
      Opacity(  opacity: scale,
        child: Transform( transform:  Matrix4.identity()..scale(scale,scale),
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.teal[50]
                      : Colors.white),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "YOUR SALARY",
                            style: TextStyle(
                                fontSize: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.teal
                                    : Colors.blueGrey)),
                          ),
                          Text(
                            "\$ $sal",
                            style: const TextStyle(
                                fontSize: 28,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            "MONEY SPENT",
                            style: TextStyle(
                                fontSize: 20,
                                color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.teal
                                    : Colors.blueGrey)),
                          ),
                          Text(
                            "\$ ${spent.toStringAsFixed(1)}",
                            style:  TextStyle(
                                fontSize: (spent>Salary)?30:28,
                                color: (spent>Salary)?Colors.red:Colors.black87,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      CircularPercentIndicator(
                        radius: 70,
                        lineWidth: (spent>Salary)?27:20,
                        percent: (spent>Salary)?1:spent / sal,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        progressColor: (spent>Salary)?Colors.redAccent:Color.lerp(Colors.orange,
                            Theme.of(context).scaffoldBackgroundColor, 0.5),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (spent>Salary)?Icon(Icons.error,color:Colors.redAccent):SizedBox(),
                            Text(
                              "${(100 * spent / sal).toStringAsFixed(1)}%",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.lerp(Colors.black,
                                    Theme.of(context).scaffoldBackgroundColor, 0.5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              )),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            color: (Theme.of(context).brightness == Brightness.dark
                ? Colors.teal[50]
                : Colors.white),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  " how did you spend it! ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 330,
                child: SfCircularChart(
                  legend: const Legend(
                    toggleSeriesVisibility: false,
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    position: LegendPosition.bottom,
                    textStyle: TextStyle(color: Colors.black26, fontSize: 10),
                  ),
                  series: [
                    DoughnutSeries(
                      cornerStyle: CornerStyle.bothFlat,
                      animationDelay: 1,
                      dataSource: (cats.map((e) => {
                            "cat": e,
                            "amount": getSumOfAmounts(exp_list, cat: e),
                          })).toList(),
                      xValueMapper: (var data, _) => data["cat"],
                      yValueMapper: (var data, _) =>
                          double.parse(data["amount"].toStringAsFixed(1)),
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children:
                      (cats.map((e) => (static_expenses(j: cats.indexOf(e)))))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
