import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// LoyaltyAccount
/// ---------------------------------------------------------------------------
///
/// Represents a customer's loyalty membership.
///
/// A customer may or may not have a loyalty account.
/// ---------------------------------------------------------------------------
@immutable
class LoyaltyAccount {
  const LoyaltyAccount({
    this.accountNumber,
    this.points = 0,
    this.totalPointsEarned = 0,
    this.totalPointsRedeemed = 0,
    this.tier = LoyaltyTier.standard,
    this.joinedAt,
    this.lastActivityDate,
  });

  //---------------------------------------------------------------------------
  // Identity
  //---------------------------------------------------------------------------

  final String? accountNumber;

  //---------------------------------------------------------------------------
  // Points
  //---------------------------------------------------------------------------

  final int points;

  final int totalPointsEarned;

  final int totalPointsRedeemed;

  //---------------------------------------------------------------------------
  // Membership
  //---------------------------------------------------------------------------

  final LoyaltyTier tier;

  //---------------------------------------------------------------------------
  // Dates
  //---------------------------------------------------------------------------

  final DateTime? joinedAt;

  final DateTime? lastActivityDate;

  //---------------------------------------------------------------------------
  // Computed
  //---------------------------------------------------------------------------

  bool get hasPoints => points > 0;

  bool get isGold =>
      tier == LoyaltyTier.gold;

  bool get isPlatinum =>
      tier == LoyaltyTier.platinum;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  LoyaltyAccount copyWith({
    String? accountNumber,
    int? points,
    int? totalPointsEarned,
    int? totalPointsRedeemed,
    LoyaltyTier? tier,
    DateTime? joinedAt,
    DateTime? lastActivityDate,
  }) {
    return LoyaltyAccount(
      accountNumber:
          accountNumber ?? this.accountNumber,
      points: points ?? this.points,
      totalPointsEarned:
          totalPointsEarned ??
          this.totalPointsEarned,
      totalPointsRedeemed:
          totalPointsRedeemed ??
          this.totalPointsRedeemed,
      tier: tier ?? this.tier,
      joinedAt:
          joinedAt ?? this.joinedAt,
      lastActivityDate:
          lastActivityDate ??
          this.lastActivityDate,
    );
  }
}

/// ---------------------------------------------------------------------------
/// LoyaltyTier
/// ---------------------------------------------------------------------------

enum LoyaltyTier {
  standard,
  silver,
  gold,
  platinum,
}