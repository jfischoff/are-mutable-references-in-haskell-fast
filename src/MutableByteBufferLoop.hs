{-# LANGUAGE BangPatterns #-}
import Data.Primitive.ByteArray
import Control.Monad

-- loopHundredMillion = replicateM_ 100000000

main :: IO ()
main = do
  mba <- newAlignedPinnedByteArray 4 8
  replicateM_ 100000000 $ do
      i <- readByteArray mba 0 :: IO Int
      let !i' = i + 1
      writeByteArray mba 0 i'