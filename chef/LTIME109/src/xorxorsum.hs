#include "include/prelude.hs"

main = docase -- getInt >>= flip replicateM_ docase

docase = do
    [n] <- getInts
    aa  <- getInts
    print $ solve n aa

solve n aa =
    foldl' (+) 0
        [ 1 | i <- [1..n-1], j <- [i+1..n], check i j ]
  where
    ary = listArray (1,n) aa :: UArray Int Int
    check i j = 2 * xor a b == a + b where
        a = ary!i
        b = ary!j
