#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [n] <- getInts
    bb  <- getInts
    putInts $ solve n bb

solve n bb =
    xor a <$> aa
  where
    allxor = foldl' xor 0 bb
    a:aa = sort $ (xor allxor) <$> bb
