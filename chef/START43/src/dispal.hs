#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    [n,x] <- getInts
    maybe (print $ -1) putStrLn $ solve n x

solve n x
    | x > q + r = Nothing
    | True = Just $ aa <> mm <> reverse aa
  where
    (q,r) = quotRem n 2
    alpha = cycle $ take x ['a'..]
    mm = take r alpha
    aa = take q $ drop r alpha
