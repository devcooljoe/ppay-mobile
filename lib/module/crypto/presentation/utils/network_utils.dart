class Network {
  final String name;
  final String description;

  const Network({required this.name, required this.description});
}

class NetworkUtils {
  static const Map<String, List<Network>> networkMap = {
    'btc': [
      Network(name: 'Bitcoin Network', description: 'Bitcoin Network'),
      Network(name: 'BEP20', description: 'BNB Smart Chain Network'),
    ],
    'dash': [Network(name: 'Dash Network', description: 'Dash Network')],
    'eth': [
      Network(name: 'ERC20', description: 'Ethereum Network'),
      Network(name: 'BEP20', description: 'BNB Smart Chain Network'),
      Network(name: 'BASE', description: 'Base Network'),
      Network(name: 'ARBITRUM', description: 'Arbitrum One'),
    ],
    'ltc': [Network(name: 'LTC', description: 'Litecoin Network')],
    'sol': [
      Network(name: 'SOLANA', description: 'Solana Network'),
      Network(name: 'BEP20', description: 'BNB Smart Chain Network'),
    ],
    'trx': [Network(name: 'TRC20', description: 'Tron Network')],
    'xaut': [Network(name: 'ERC20', description: 'Ethereum Network')],
    'usdt': [
      Network(name: 'BEP20', description: 'BNB Smart Chain Network'),
      Network(name: 'POLYGON', description: 'Polygon Network'),
      Network(name: 'TRC20', description: 'Tron Network'),
      Network(name: 'ERC20', description: 'Ethereum Network'),
      Network(name: 'SOLANA', description: 'Solana Network'),
      Network(name: 'TON', description: 'TON Network'),
      Network(name: 'CELO', description: 'CELO'),
      Network(name: 'LISK', description: 'LISK'),
      Network(name: 'ARBITRUM', description: 'Arbitrum One'),
      Network(name: 'OPTIMISM', description: 'Optimism Mainnet'),
    ],
    'usdc': [
      Network(name: 'BEP20', description: 'BNB Smart Chain Network'),
      Network(name: 'POLYGON', description: 'Polygon Network'),
      Network(name: 'ERC20', description: 'Ethereum Network'),
      Network(name: 'SOLANA', description: 'Solana Network'),
      Network(name: 'LISK', description: 'LISK'),
      Network(name: 'ARBITRUM', description: 'Arbitrum One'),
      Network(name: 'BASE', description: 'Base Network'),
    ],
    'xrp': [Network(name: 'XRP', description: 'Ripple Network')],
  };

  static List<Network> getNetworksForCurrency(String currency) {
    return networkMap[currency.toLowerCase()] ?? [];
  }
}
