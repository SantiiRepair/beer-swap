import { DefaultSeoProps } from 'next-seo'

export const SEO: DefaultSeoProps = {
  titleTemplate: '%s | BeerSwap',
  defaultTitle: 'BeerSwap',
  description:
    'Cheaper and faster than Uniswap? Discover BeerSwap, the leading DEX on BNB Smart Chain (BSC) with the best farms in DeFi and a lottery for BRT.',
  twitter: {
    cardType: 'summary_large_image',
    handle: '@BeerSwap',
    site: '@BeerSwap',
  },
  openGraph: {
    title: '🍺 BeerSwap - A next evolution DeFi exchange on BNB Smart Chain (BSC)',
    description:
      'The most popular AMM on BSC by user count! Earn BRT through yield farming or win it in the Lottery, then stake it in Pools to earn more tokens! On a platform you can trust.',
    images: [{ url: 'https://camo.githubusercontent.com/fd3c64f4cd5f61b2c93b781ace9dce7a893776b41e462587778ff4c00f11cc89/68747470733a2f2f692e6962622e636f2f6a57487a5652362f6865726f2e706e67' }],
  },
}
