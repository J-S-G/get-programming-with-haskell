-- Lambda Function
    -- (\x -> x) [1.2.3]
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

lam x = x * 2

-- sumSquareOrSquareSum x y = if sumSquare > squareSum 
--                            then sumSquare 
--                            else squareSum
--     where sumSquare = x^2 + y^2
--           squareSum = (x+y)^2

-- sumSquareOrSquareSum x y = if (x^2 + y^2) > ((x+y)^2)
--                            then (x^2 + y^2)
--                            else (x+y)^2

-- body sumSquare squareSum = if sumSquare > squareSum 
--                            then sumSquare 
--                            else squareSum 

-- sumSquareOrSquareSum x y = (\sumSquare squareSum ->
--                            if sumSquare > squareSum 
--                            then sumSquare 
--                            else squareSum)

-- Rewrite this code using a lambda function 
-- doubleDouble x = dubs*2
-- where dubs = x*2

-- Let or Where 
-- doubleDoube x = (\dubs -> dubs*2)(x*2)

-- sumSquareOrSquareSum x y = let sumSquare = (x^2 + y^2) --Variables Defined First
--                                squareSum = (x+y)^2
--                            in -- Body Begins, 
--                              if sumSquare > squareSum -- single splace indent | Body of let expression
--                             then sumSquare 
--                             else squareSum 

overwrite x = let x = 2 
              in 
               let x = 3 
                in 
                 let x = 4
                  in 
                   x 

-- overwrite function allow you to redefine variables legally 
overwrite x = (\x ->
              (\x ->
                (\x -> x) 4
               )3
            )2

-- immediately invoked function expression (IIFE).
-- (function(){
-- var a = 2;
-- var b = 3;
-- var c = a + b;
-- var d = libraryAdd(10,20);
-- console.log(c);
-- })()

-- Lexical Scope to change values 
x = 4
add1 y = y + x 
add2 y = (\x -> y + x)3
add3 y = (\y ->
            (\x -> y + x)1)2