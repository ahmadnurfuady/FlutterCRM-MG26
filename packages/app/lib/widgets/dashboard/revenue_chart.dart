import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Revenue Trend',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.dividerColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Last 6 Months',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.iconTheme.color,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.dividerColor),
          ),
          child: Stack(
            children: [
              // Bar Chart for the vertical bars
              BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  maxY: 160,
                  minY: 0,
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                      show: true,
                      leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const titles = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'May',
                            'Jun'
                          ];
                          if (value.toInt() < 0 ||
                              value.toInt() >= titles.length) {
                            return const SizedBox.shrink();
                          }
                          final isSelected = value.toInt() == 5;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(titles[value.toInt()],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected
                                      ? AppTheme.primary
                                      : theme.iconTheme.color,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                )),
                          );
                        },
                      ))),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _makeBarGroup(0, 70, false, theme),
                    _makeBarGroup(1, 100, false, theme),
                    _makeBarGroup(2, 90, false, theme),
                    _makeBarGroup(3, 110, false, theme),
                    _makeBarGroup(4, 130, false, theme),
                    _makeBarGroup(5, 140, true, theme),
                  ],
                ),
              ),
              // Line Chart for the overlay curve
              // Note: overlaying perfectly with bars is tricky with two charts,
              // but we can approximate for visual fidelity.
              LineChart(
                LineChartData(
                  minY: 0,
                  maxY: 160,
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 40),
                        FlSpot(1, 70),
                        FlSpot(2, 60),
                        FlSpot(3, 100),
                        FlSpot(4, 110),
                        FlSpot(5, 120),
                      ],
                      isCurved: true,
                      color: AppTheme.primary,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppTheme.primary.withValues(alpha: 0.2),
                            AppTheme.primary.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BarChartGroupData _makeBarGroup(
      int x, double y, bool isSelected, ThemeData theme) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: y,
            color: isSelected
                ? AppTheme.primary
                : theme.iconTheme.color?.withValues(alpha: 0.2) ?? Colors.grey,
            width: 6,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
              show: false,
            )),
      ],
    );
  }
}
