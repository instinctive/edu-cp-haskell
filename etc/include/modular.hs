#ifndef INCLUDE_MODULAR_HS_
#define INCLUDE_MODULAR_HS_

-- modular.hs {{{
two_mod = modulus + modulus
mod' x | x < modulus = x
       | x < two_mod = x - modulus
       | otherwise   = rem x modulus
modDivide a b = mod' (mod' a * modInverse b)
modInverse b = mod' (s + modulus) where (s,_) = extEuclid b modulus
extEuclid a 0 = (1, 0)
extEuclid a b = (t, s - q * t)
  where
    (q,r) = quotRem a b
    (s,t) = extEuclid b r
-- modular.hs }}}

#endif
