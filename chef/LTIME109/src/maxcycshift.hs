#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [n] <- getInts
    aa  <- getInts
    print $ solve n aa

solve n aa =
    maximum $ value <$> [0..n-1]
  where
    ary = listArray (0,n-1) aa :: UArray Int Int
    xx i = scanl1 xor [ ary!k | j <- [0..n-1], let k = rem (i+j) n ]
    value i = IS.size $ foldl' (flip IS.insert) IS.empty $ xx i

-- docase = do
--     [n] <- getInts
--     aa  <- getInts
--     print $ solve n aa

-- solve n aa =
--     maximum $ value <$> aaa
--   where
--     value = IS.size . IS.fromList . xors
--     xors = scanl1 xor
--     aaa = take n atails
--     atails = take n <$> tails cyc
--     cyc = cycle aa
