class NetworkUtils {
  static List<String> getNetworksForCurrency(String currency) {
    switch (currency.toLowerCase()) {
      case 'btc':
        return ['BTC', 'BEP20'];
      case 'eth':
        return ['ERC20', 'BEP20', 'BASE'];
      case 'usdt':
        return ['ERC20', 'TRC20', 'BEP20', 'POLYGON', 'ARBITRUM', 'OPTIMISM', 'SOLANA'];
      case 'xrp':
        return ['RIPPLE'];
      case 'ltc':
        return ['LTC'];
      case 'dash':
        return ['DASH'];
      case 'bnb':
        return ['BEP20'];
      case 'sol':
        return ['SOLANA'];
      default:
        return [currency.toUpperCase()];
    }
  }
}
