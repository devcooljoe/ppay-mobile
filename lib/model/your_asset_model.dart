
class YourAssetModel {
  final String containerImage;
  final String cryptoTitle;
  final String cryptoTitleshort;
  final String cryptosubTitle;
  final String cryptoPrice;

  YourAssetModel({
    required this.containerImage,
    required this.cryptoTitle,
    required this.cryptoTitleshort,
    required this.cryptosubTitle,
    required this.cryptoPrice,
  });
}

final List<YourAssetModel> yourAsset = [
  YourAssetModel(
    containerImage: 'assets/images/bitcoin.png',
    cryptoTitle: 'Bitcoin',
    cryptoTitleshort: 'BTC',
    cryptosubTitle: '0.000005 BTC',
    cryptoPrice: '₦34,000.00',
  ),
  YourAssetModel(
    containerImage: 'assets/images/ethereum.png',
    cryptoTitle: 'Ethereum',
    cryptoTitleshort: 'ETH',
    cryptosubTitle: '0.000005 ETH',
    cryptoPrice: '₦34,000.00',
  ),
  YourAssetModel(
    containerImage: 'assets/images/solana.png',
    cryptoTitle: 'Solana',
    cryptoTitleshort: 'SOL',
    cryptosubTitle: '0.000005 SOL',
    cryptoPrice: '₦34,000.00',
  ),
];
