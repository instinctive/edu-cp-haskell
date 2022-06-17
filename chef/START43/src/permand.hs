#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [n] <- getInts
    case solve n of
        Nothing -> print $ -1
        Just (aa,bb) -> putInts aa >> putInts bb

solve 0 = Just ([],[])
solve 1 = Just ([1],[1])
solve n | odd n = Nothing
solve n
    | pow == n = Just (aa <> [n-1,n], bb <> [n,n-1])
    | True     = Just (mm,nn)
  where
    mm = uu <> xx
    nn = vv <> yy
    pow:_ = dropWhile (<n) (iterate (*2) 1)
    Just (aa,bb) = solve (n-2)
    Just (uu,vv) = solve (pow-n-2)
    xx = [pow-n-1..n]
    yy = reverse xx

check (x:xx) = all (==x) xx

test aa bb = check $ zipWith (.&.) aa bb
