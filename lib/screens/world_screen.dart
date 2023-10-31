import 'package:covid/Model/country.dart';
import 'package:covid/button.dart';
import 'package:covid/screens/countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

import '../reusbale.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  Country country =
      Country(name: 'Pakistan', cases: 50000, died: 45630, recovered: 6560);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PieChart(
                  animationDuration: const Duration(seconds: 2),
                  chartType: ChartType.disc,
                  chartRadius: MediaQuery.of(context).size.width / 2.0,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true,
                  ),
                  legendOptions:
                      const LegendOptions(legendPosition: LegendPosition.left),
                  dataMap: {
                    'Cases': double.parse(country.cases.toString()),
                    'Died': double.parse(country.died.toString()),
                    'Recovered': double.parse(country.recovered.toString()),
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Card(
                    child: Column(
                      children: [
                        Reusable(
                          title: 'Cases',
                          value: '50000',
                        ),
                        Divider(
                          color: Colors.blueGrey,
                        ),
                        Reusable(
                          title: 'Died',
                          value: '7500',
                        ),
                        Divider(
                          color: Colors.blueGrey,
                        ),
                        Reusable(
                          title: 'Recovered',
                          value: '890',
                        ),
                        Divider(
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .09,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Button(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CountriesListScreen(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
