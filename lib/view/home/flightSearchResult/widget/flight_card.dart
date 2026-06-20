import 'package:flight_search/configs/extension/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../../model/flight_model.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;

  const FlightCard({super.key, required this.flight});

  String _formatTimeAMPM(String? rawTime) {
    if (rawTime == null || rawTime.isEmpty) return '--:--';
    try {
      final dateTime = DateTime.parse(rawTime);
      return DateFormat('h:mm a').format(dateTime);
    } catch (e) {
      return rawTime.split(' ').last;
    }
  }

  String _formatDate(String? rawTime) {
    if (rawTime == null || rawTime.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(rawTime);
      return DateFormat('E, MMM d').format(dateTime); // e.g., Thu, Jun 18
    } catch (e) {
      return '';
    }
  }

  String _formatDuration(int? minutes) {
    if (minutes == null) return '0 hr 0 min';
    final int hours = minutes ~/ 60;
    final int mins = minutes % 60;
    return '$hours hr $mins min';
  }

  @override
  Widget build(BuildContext context) {
    final them = context.theme;
    final segments = flight.flights ?? [];
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstSegment = segments.first;
    final lastSegment = segments.last;

    final departureTimeStr = firstSegment.departureAirport?.time;
    final departureTime = _formatTimeAMPM(departureTimeStr);
    final departureDate = _formatDate(departureTimeStr);

    final arrivalTime = _formatTimeAMPM(lastSegment.arrivalAirport?.time);

    final departureName = firstSegment.departureAirport?.name ?? '';
    final departureCode = firstSegment.departureAirport?.id ?? '';
    final arrivalName = lastSegment.arrivalAirport?.name ?? '';
    final arrivalCode = lastSegment.arrivalAirport?.id ?? '';

    final airlineLogo = flight.airlineLogo ?? firstSegment.airlineLogo ?? '';
    final airlineName = firstSegment.airline ?? 'Unknown Airline';
    final airplane = firstSegment.airplane ?? '';
    final flightNumber = firstSegment.flightNumber ?? '';
    final travelClass = firstSegment.travelClass ?? '';

    final price = flight.price ?? 0;
    final emissions = flight.carbonEmissions?.thisFlight;
    final emissionsDiff = flight.carbonEmissions?.differencePercent;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: them.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: them.colorScheme.outline.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: them.colorScheme.shadow.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          if (airlineLogo.isNotEmpty)
                            CachedNetworkImage(
                              imageUrl: airlineLogo,
                              width: 24,
                              height: 24,
                              errorWidget: (context, url, error) => const Icon(Icons.flight, size: 24),
                            )
                          else
                            Icon(Icons.flight, size: 24, color: them.colorScheme.primary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Departure • $departureDate',
                              style: them.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: them.colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: them.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: them.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Emissions badge
                    if (emissions != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${emissions ~/ 1000} kg CO2',
                            style: them.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (emissionsDiff != null)
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: emissionsDiff < 0 ? them.colorScheme.tertiary.withOpacity(0.1) : them.colorScheme.error.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${emissionsDiff > 0 ? '+' : ''}$emissionsDiff% emissions',
                                style: them.textTheme.labelSmall?.copyWith(
                                  fontSize: 10,
                                  color: emissionsDiff < 0 ? them.colorScheme.tertiary : them.colorScheme.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      )
                    else
                      const SizedBox.shrink(),
                    // Select flight button & Icon
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            side: BorderSide(color: them.colorScheme.outline.withOpacity(0.2)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            'Select flight',
                            style: them.textTheme.labelLarge?.copyWith(color: them.colorScheme.primary, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.keyboard_arrow_down, color: them.colorScheme.outline),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Divider(height: 1, color: them.colorScheme.outline.withOpacity(0.1), thickness: 1),

          // Expanded Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Logo
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 4.0),
                      child: airlineLogo.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: airlineLogo,
                              width: 32,
                              height: 32,
                              errorWidget: (context, url, error) => const Icon(Icons.flight, size: 32),
                            )
                          : Icon(Icons.flight, size: 32, color: them.colorScheme.outline),
                    ),

                    // Middle Timeline
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Departure Line
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4, right: 12),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: them.colorScheme.outline.withOpacity(0.5), width: 2),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: them.textTheme.bodyMedium?.copyWith(color: them.colorScheme.onSurface),
                                    children: [
                                      TextSpan(text: '$departureTime - ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: '$departureName ($departureCode)'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Duration Line (Dotted visual)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 4, right: 17),
                                width: 2,
                                height: 30,
                                color: them.colorScheme.outline.withOpacity(0.2),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(
                                  'Travel time: ${_formatDuration(flight.totalDuration)}',
                                  style: them.textTheme.bodySmall?.copyWith(color: them.colorScheme.outline),
                                ),
                              ),
                            ],
                          ),

                          // Arrival Line
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4, right: 12),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: them.colorScheme.outline.withOpacity(0.5), width: 2),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: them.textTheme.bodyMedium?.copyWith(color: them.colorScheme.onSurface),
                                    children: [
                                      TextSpan(text: '$arrivalTime - ', style: const TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: '$arrivalName ($arrivalCode)'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),
                          // Meta info
                          Text(
                            '$airlineName • $travelClass • $airplane • $flightNumber',
                            style: them.textTheme.bodySmall?.copyWith(color: them.colorScheme.outline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                if (firstSegment.extensions != null && firstSegment.extensions!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Divider(height: 1, color: them.colorScheme.outline.withOpacity(0.1)),
                  const SizedBox(height: 12),
                  // Amenities Wrap
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 8.0,
                    children: firstSegment.extensions!.map((ext) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, size: 14, color: them.colorScheme.outline),
                          const SizedBox(width: 4),
                          Text(
                            ext,
                            style: them.textTheme.labelSmall?.copyWith(color: them.colorScheme.outline),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
