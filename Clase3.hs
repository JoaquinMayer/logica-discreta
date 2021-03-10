module Clase3 where

import Prelude (Show)

data Bool = False | True
    deriving Show

not :: Bool -> Bool

not = \x -> case x of {
    False -> True;
    True -> False;    
}

and :: Bool -> Bool -> Bool
and = \a -> \b -> case a of {
    True -> b;
    False -> False
}

or :: Bool -> Bool -> Bool
or = \a b -> case a of {
    True -> b;
    False -> False
}

-- Notacion infija pero con simbolo
(&&) :: Bool -> Bool -> Bool
(&&) = \a b -> case a of {
    True -> b;
    False -> False
}


-- PATTERN MATCHING
(||) :: Bool -> Bool -> Bool
True || _ = False
False || y = y

