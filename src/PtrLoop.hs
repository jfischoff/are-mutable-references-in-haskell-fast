{-# LANGUAGE BangPatterns #-}
import Control.Monad
import Foreign.Storable
import Foreign.Marshal.Alloc

main :: IO ()
main = alloca $ \ptr -> do
   poke ptr (0 :: Int)
   replicateM_ 100000000 $ do
     i <- peek ptr
     let !i' = i + 1
     poke ptr i'