module Clase1 where

-- Definimos un nuevo tipo, enumerando sus valores (objetos)
data Nota = Do | DoS | Re | ReS | Mi | Fa | FaS | Sol | SolS | La | LaS | Si
    deriving Show

-- Definimos una expresión que es igual a un valor del tipo Nota
reB :: Nota
reB = DoS

-- Una expresión que no tiene valor, que en cómputo no puedo determinar qué objeto denota.
indef :: Nota
indef = indef