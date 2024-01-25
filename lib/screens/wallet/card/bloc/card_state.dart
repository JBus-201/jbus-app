part of 'card_bloc.dart';

class CardState extends Equatable {
  const CardState(
      {
      required this.cardNumber,
      required this.cvv,
      required this.mm,
      required this.yy,
      required this.cardHolderName});

  final String cardNumber;
  final String cvv;
  final String mm;
  final String yy;
  final String cardHolderName;

  @override
  List<Object> get props => [cardNumber, cvv, mm, yy, cardHolderName];

  CardState copyWith(
      {
      required String cardNumber,
      required String cvv,
      required String mm,
      required String yy,
      required String cardHolderName}) {
    return CardState(
        cardNumber: cardNumber,
        cvv: cvv,
        mm: mm,
        yy: yy,
        cardHolderName: cardHolderName);
  }
}
