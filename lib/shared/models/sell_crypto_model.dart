class SellCryptoModel {
  final String containerImage;
  final String cryptoTitle;
  final String cryptosubTitle;
  final String cryptoPrice;

  SellCryptoModel({
    required this.containerImage,
    required this.cryptoTitle,
    required this.cryptosubTitle,
    required this.cryptoPrice,
  });
}

final List<SellCryptoModel> sellCrypto = [
  SellCryptoModel(
    containerImage: 'assets/images/bitcoin.png',
    cryptoTitle: 'Bitcoin',
    cryptosubTitle: '0.000005 BTC',
    cryptoPrice: '₦34,000.00',
  ),
  SellCryptoModel(
    containerImage: 'assets/images/ethereum.png',
    cryptoTitle: 'Ethereum',
    cryptosubTitle: '0.000005 ETH',
    cryptoPrice: '₦34,000.00',
  ),
  SellCryptoModel(
    containerImage: 'assets/images/solana.png',
    cryptoTitle: 'Solana',
    cryptosubTitle: '0.000005 SOL',
    cryptoPrice: '₦34,000.00',
  ),
];
