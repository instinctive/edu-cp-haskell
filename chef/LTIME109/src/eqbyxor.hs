#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [a,b,n] <- getInts
    print $ solve a b n

solve a b n
    | null bb      =  0
    | x < n        =  1
    | head bb >= n = -1
    | otherwise    =  2
  where
    x = xor a b
    bb = bit <$> filter (testBit x) [30,29..0]


