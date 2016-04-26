# HSet

A simple implementation of heterogeneous sets
in Haskell, assuming they implement `Typeable`:

```haskell
{-# LANGUAGE
    DeriveDataTypeable
  , ScopedTypeVariables
  #-}

import Data.Typeable
import Data.HSet.Mutable as HSet
import Control.Monad.ST


data Foo = Foo
  { foo1 :: Int
  , foo2 :: Int
  } deriving (Typeable)

data Bar = Bar
  { bar1 :: Double
  } deriving (Typeable)


mySet :: ST s (HSet s)
mySet = do
  xs <- HSet.new
  (fooKey :: HKey Foo) <- HSet.insert (Foo 1 2) xs
  (barKey :: HKey Bar) <- HSet.insert (Bar 3.45) xs
```

You can then do lookups and deletions with the
`fooKey` and `barKey` mutable references.
