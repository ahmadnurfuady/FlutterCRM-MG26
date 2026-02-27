import 'package:flutter/material.dart';
import 'package:crm_dashboard/theme/app_theme.dart';
import 'package:crm_dashboard/widgets/deals/deal_helpers.dart'; // nanti kita buat
import 'package:crm_dashboard/screens/deals_pipeline_screen.dart'; // untuk mengakses enum dan model Deal

class DealsListView extends StatelessWidget {
  final List<Deal> deals;

  const DealsListView({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: getBackgroundColorForStage(deal.stage) ?? Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Avatar/Initials
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: deal.ownerColor ?? AppTheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: deal.ownerImage != null
                        ? ClipOval(
                            child: Image.network(
                              deal.ownerImage!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    deal.ownerInitials ?? deal.ownerName[0],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: Text(
                              deal.ownerInitials ?? deal.ownerName[0],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 16),

                  // Deal Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          deal.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          deal.ownerName,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            // Stage Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: getStageColor(deal.stage)
                                    .withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                getStageName(deal.stage),
                                style: TextStyle(
                                  color: getStageColor(deal.stage),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Probability
                            if (deal.stage != DealStage.won &&
                                deal.stage != DealStage.lose &&
                                deal.stage != DealStage.payment)
                              Row(
                                children: [
                                  Icon(
                                    Icons.trending_up,
                                    size: 14,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${(deal.probability * 100).toInt()}%',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        deal.amount,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (deal.stage != DealStage.won &&
                          deal.stage != DealStage.lose &&
                          deal.stage != DealStage.payment)
                        SizedBox(
                          width: 60,
                          child: LinearProgressIndicator(
                            value: deal.probability,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              getStageColor(deal.stage),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
