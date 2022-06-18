#include "include/prelude.hs"
#include "include/modular.hs"

modulus = 10^9 + 7

main = docase -- getInt >>= flip replicateM_ docase

trim (a:b:xx) | a == b = trim (b:xx)
trim xx = xx

docase = do
    [n,m,x,y] <- getInts
    mines <- trim . sort . map (`quotRem` m) <$> getInts
    paths <- newArray (-1,y) 0 :: IO (IOUArray Int Int)
    writeArray paths 0 1
    let solve i j mines | i > x = readArray paths y >>= print
        solve i j mines | j > y = solve (i+1) 0 mines
        solve i j ((u,v):mines) | u == i && v == j =
            writeArray paths j 0 >> solve i (j+1) mines
        solve i j mines = do
            a <- readArray paths j
            b <- readArray paths (j-1)
            writeArray paths j (mod' $ a+b)
            solve i (j+1) mines
    solve 0 0 mines
