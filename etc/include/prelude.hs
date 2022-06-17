#ifndef INCLUDE_PRELUDE_HS_
#define INCLUDE_PRELUDE_HS_

-- prelude.hs {{{
-- vim: foldmethod=marker
#include "pragmas.hs"
module Main where
#include "imports.hs"
readInt s = let Just (i,_) = C.readInt s in i :: Int
getInt  =     readInt           <$> C.getLine
getInts = map readInt . C.words <$> C.getLine
putInts :: [Int] -> IO ()
putInts = putStrLn . unwords . map show
ynq = putStrLn . bool "NO" "YES"
(.:) = \f g x y -> f (g x y)
infixl 1 <&>
(<&>) :: Functor f => f a -> (a -> b) -> f b
as <&> f = f <$> as
-- prelude.hs }}}

#endif
