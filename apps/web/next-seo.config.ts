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
    images: [{ url: 'https://assets.pancakeswap.finance/web/og/hero.jpg' }],
  },
}
