import 'package:flight_search/configs/extension/context_ext.dart';
import 'package:flutter/material.dart';

class AirportSelector extends StatelessWidget {
  const AirportSelector(
      {super.key,
        this.label,
        this.airportName,
        this.airportCode,
        required this.onTap});
  final String? label, airportName, airportCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Text(
                label!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.flight_takeoff, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    airportName ?? 'Select Airport',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: airportName != null
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: airportName != null
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.outline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (airportCode != null)
                  Text(
                    airportCode!,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
