{-# LANGUAGE
    DeriveGeneric
  #-}

module Data.HSet.Types where

import GHC.Fingerprint (Fingerprint(..))
import GHC.Generics
import Data.Hashable



data HKey' = HKey'
  { getTypeIndex :: {-# UNPACK #-} !Fingerprint
  , getTypeCount :: {-# UNPACK #-} !Int
  } deriving (Eq, Generic)

instance Hashable Fingerprint where
  hashWithSalt s (Fingerprint x y) =
    s `hashWithSalt` x `hashWithSalt` y

instance Hashable HKey'

newtype HKey a = HKey
  { getHKey :: HKey'
  } deriving (Eq)
