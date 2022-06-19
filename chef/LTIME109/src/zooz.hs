#include "include/prelude.hs"

main = getInt >>= flip replicateM_ docase

docase = do
    n <- getInt
    putStrLn $ solve n

solve n =
    concat $ replicate q "01" <> [mid r] <> replicate q "10"
  where
    (q,r) = quotRem n 4
    mid = \case
        0 -> ""
        1 -> "0"
        2 -> "00"
        3 -> "010"
