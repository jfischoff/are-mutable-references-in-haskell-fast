{-# LANGUAGE BangPatterns #-}
import Control.Monad
import Data.Vector.Unboxed.Mutable as M

-- loopHundredMillion = replicateM_ 100000000

main :: IO ()
main = do
  mba <- M.new 1
  replicateM_ 100000000 $ do
      i <- M.read mba 0 :: IO Int
      let !i' = i + 1
      M.write mba 0 i'