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

-- Definir una función que dada una nota, devuelve la posición en la escala.
ord :: Nota -> Int
ord = \n -> case n of {
    Do  -> 1;
    DoS -> 2;
    Re  -> 3;
    ReS -> 4;
    Mi  -> 5;
    Fa  -> 6;
    FaS -> 7;
    Sol -> 8;
    SolS -> 9;
    La  -> 10;
    LaS -> 11;
    Si  -> 12
}

-- Es una expresión que involucra a la función definida anteriormente. Es válida y computa a un valor.
b :: Int
b = ord reB

-- Alias o renombres de tipos ya existentes
type Octava = Int
type Sonido = (Nota, Octava)

doCentral :: Sonido
doCentral = (Do, 3)


-- Voy a introducir un tipo para definir las duraciones de los sonidos
data Duracion = R | B | N | C | SC | F | SF
    deriving Show


-- No ejecutar sonido en una duración.  Sil :: Duracion -> Musica 
-- Ejecutar un sonido con una duración. Son :: Sonido -> Duracion -> Musica
-- Ejecutar al mismo tiempo dos Musica. Par :: Musica -> Musica -> Musica
-- Ejecutar en secuencia dos Musica.    Seq :: Musica -> Musica -> Musica
data Musica = Sil Duracion
            | Son Sonido Duracion
            | Par Musica Musica
            | Seq Musica Musica

ej1 :: Musica
ej1 = Sil B

ej2 :: Musica
ej2 = Son doCentral SC

ej3 :: Musica
ej3 = Son (Si, 4) F

ej4 :: Musica
ej4 = Seq ej2 (Seq ej3 (Par ej1 ej2))


-- Dada la siguiente función
transportar :: Int -> Sonido -> Sonido
transportar = undefined

transportarPieza :: Int -> Musica -> Musica
transportarPieza = \x -> \p -> case p of {
    Sil d     -> Sil d;
    Son s d   -> Son (transportar x s) d;
    Par m1 m2 -> Par (transportarPieza x m1) (transportarPieza x m2);
    Seq m1 m2 -> Seq (transportarPieza x m1) (transportarPieza x m2)
}

duplicar :: Int -> Int
duplicar = \x -> x * 2
