class Company {
  final String title;
  final String description;
  final String logo;
  final List<String> marketValue;
  Company(this.title,this.description,this.logo,this.marketValue);
      
  static List<Company> companyList() {
    return [
      Company(
        'Walmart Inc. (WMT)',
        'Founded in 1962, Walmart has since grown into one of the world\'s largest retailers. The company operates discount stores, supercenters, neighborhood markets, as well as a robust online platform. Walmart sells a wide variety of merchandise including clothing and apparel, home goods, books, jewelry, food and beverage, pharmaceutical supplies, and automotive equipment.',
        'assets/images/c1.jpeg',
        [
          'Revenue (TTM): \$600.11 billion',
          'Net Income (TTM): \$8.97 billion',
          'Market Cap: \$390.66 billion',
          '1-Year Trailing Total Return: 1.75%',
          'Exchange: New York Stock Exchange'
        ],
      ),
      Company(
        'Amazon.com Inc. (AMZN)',
        'Amazon is the world\'s largest online retailer by market cap. The company began as an online bookseller and has since grown to encompass virtually every category of retail. Besides selling products through its e-commerce platform, Amazon owns subsidiaries including Whole Foods Market and home security company Ring. Amazon\'s fastest-growing areas of business are cloud computing services, subscription products like Amazon Prime, and streaming movies and other entertainment.',
        'assets/images/c2.jpeg',
        [
          'Revenue (TTM): \$502.19 billion',
          'Net Income (TTM): \$11.32 billion',
          'Market Cap: \$916.82 billion',
          '1-Year Trailing Total Return: -44.35%',
          'Exchange: NASDAQ'
        ],
      ),
      Company(
        'China Petroleum & Chemical Corp. (SNPMF)',
        'China Petroleum & Chemical is a producer and distributor of a variety of petrochemical and petroleum products. The company\'s products include gasoline, diesel, kerosene, synthetic rubbers and resins, jet fuel, and chemical fertilizers, among other related offerings. Also known as Sinopec, China Petroleum & Chemical is among the largest oil refining, gas, and petrochemical companies in the world. It is administered by the State Council of the People\'s Republic of China.',
        'assets/images/c3.jpeg',
        [
          'Revenue (TTM): \$486.84 billion',
          'Net Income (TTM): \$10.47 billion',
          'Market Cap: \$60.32 billion',
          '1-Year Trailing Total Return: 19.61%',
          'Exchange: OTC Markets'
        ],
      ),
      Company(
        'PetroChina Co. Ltd. (PCCYF)',
        'Oil and gas company PetroChina is engaged in oil exploration, development, production, and sales. It also manufactures petrochemical products. PetroChina is the exchange-listed branch of the Chinese state-owned China National Petroleum Corporation.',
        'assets/images/c4.jpeg',
        [
          'Revenue (TTM): \$486.40 billion',
          'Net Income (TTM): \$20.89 billion',
          'Market Cap: \$82.73 billion',
          '1-Year Trailing Total Return: 15.24%',
          'Exchange: OTC Markets'
        ],
      ),
      Company(
        'Apple Inc. (AAPL)',
        'Apple designs, manufactures, and markets a broad range of consumer technology products, including smartphones, personal computers, tablets, wearable devices, home entertainment devices, and more. Among the company\'s most popular products are its iPhone line of smartphones and Mac line of computers. Apple also is building a fast-growing services business, operating digital content stores, selling streaming video games, and providing streaming services such as Apple+, a platform for on-demand entertainment content.',
        'assets/images/c5.jpeg',
        [
          'Revenue (TTM): \$394.33 billion',
          'Net Income (TTM): \$99.80 billion',
          'Market Cap: \$2.08 trillion',
          '1-Year Trailing Total Return: -23.64%',
          'Exchange: NASDAQ'
        ],
      ),
    ];
  }
}