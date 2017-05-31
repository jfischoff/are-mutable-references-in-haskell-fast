{-# LANGUAGE BangPatterns #-}
import Control.Monad
import Data.IORef

main :: IO ()
main = do
  ref <- newIORef (0 :: Int)
  replicateM_ 100000000 $ modifyIORef' ref (+1)