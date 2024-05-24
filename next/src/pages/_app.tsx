import { CacheProvider, EmotionCache } from '@emotion/react'
import CssBaseline from '@mui/material/CssBaseline'
import { ThemeProvider } from '@mui/material/styles'
import { AppProps } from 'next/app'

import CurrentUserFetch from '@/components/CurrentUserFetch'
import Header from '@/components/Header'
import createEmotionCache from '@/styles/createEmotionCache'
import theme from '@/styles/theme'
import '@/styles/destyle.css'

// Client-side cache, shared for the whole session of the user in the browser.
const clientSideEmotionCache = createEmotionCache()

interface MyAppProps extends AppProps {
  emotionCache?: EmotionCache
}

export default function MyApp(props: MyAppProps): JSX.Element {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props
  return (
    <CacheProvider value={emotionCache}>
      <ThemeProvider theme={theme}>
        {/* CssBaseline kickstart an elegant, consistent, and simple baseline to build upon. */}
        <CssBaseline />
        <CurrentUserFetch />
        <Header />
        <Component {...pageProps} />
      </ThemeProvider>
    </CacheProvider>
  )
}
