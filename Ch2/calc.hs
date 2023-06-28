-- Rules For Creating Functions in Haskell: 
-- must always take an argument 
-- must always return a value 
-- Calling the same function with the same argument must always return the same result.


calcChange owed given = if given - owed > 0
                        then given - owed 
                        else 0
    where change = given - owed 

-- 2.3
doublePlusTow x = doubleX + 2
    where doubleX = x*2

-- the let keyword marks variables different from ea. otherwise
-- GHCi> let x = 7
-- GHCi> x
-- 7

-- one-line functions can be defined the same way:
-- GHCi> let f x = x^2
-- GHCi> f 8
-- 64

--2.1 - 2.3
inc n = n
double n = n*2
square n = n**2

check n = if even n
          then n - 2
          else 3 * n - 1
