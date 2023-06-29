import Data.List
-- Functions as arguments 
-- ifEvenInc n = if even n 
--               then n + 1
--               else n 

-- ifEvenDouble n = if even n 
--                  then n*2
--                  else n 

-- ifEvenSquare n = if even n 
--                  then n^2
--                  else n 

-- Pass a function as an argument to perform the desired behavior 

ifEven myFunction x = if even x
                      then myFunction x
                      else x

-- Abstractly incrementing, doubling, and squaring using 3 functions
inc n = n + 1
double n = n*2
square n = n^2

-- Using your abstract functions 
ifEvenInc n = ifEven inc n
ifEvenDouble n = ifEven double n
ifEvenSquare n = ifEven square n

-- GHCi, version 8.8.4: https://www.haskell.org/ghc/  :? for help
-- Prelude> :l FirstClassFunctions.hs
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> ifEven (\x -> x*2) 6
-- 12

-- Write a lambda function for cubing x and pass it to ifEven:

-- *Main> ifEven (\x -> x*3)2
-- 6

-- Tuples: fixed size 
author = ("Will", "Kurt")
-- Prelude> :l FirstClassFunctions.hs
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> fst author
-- "Will"
-- *Main> snd author
-- "Kurt"

names = [("Ian", "Curtis"),
        ("Bernard","Sumner"),
        ("Peter","Hook"),
        ("Stephen","Morris")]

-- Sort the names: import Data.List 
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> sort names
-- [("Bernard","Sumner"),("Ian","Curtis"),("Peter","Hook"),("Stephen","Morris")]

-- Sort By Last Name:
compareLastNames :: (Ord a1, Ord a2) => (a2, a1) -> (a2, a1) -> Ordering
compareLastNames name1 name2
  | lastName1 > lastName2 = GT
  | lastName1 < lastName2 = LT
  | lastName1 == lastName2 && firstName1 > firstName2 = GT
  | lastName1 == lastName2 && firstName1 < firstName2 = LT
  | otherwise = EQ
  where
      lastName1 = snd name1
      lastName2 = snd name2
      firstName1 = fst name1
      firstName2 = fst name2

-- Using sortBy w/your custom sorting 
-- Prelude> :l FirstClassFunctions.hs
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> sortBy compareLastNames names
-- [("Ian","Curtis"),("Peter","Hook"),("Stephen","Morris"),("Bernard","Sumner")]

-- Sending newsletters to various regional post office boxes - Pt1
-- PO Box 1234, San Francisco, CA, 94111
-- PO Box 789, New York, NY, 10013
-- PO Box 456, Reno, NV, 89523

-- addressLetter name location = nameText++" - "++location
--     where nameText = (fst name)++" "++(snd name)

-- Prelude> :l FirstClassFunctions.hs
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> addressLetter ("Bob","Smith") "PO Box 1234 - San Francisco, CA, 94111"
-- "Bob Smith - PO Box 1234 - San Francisco, CA, 94111"

-- Sending newsletters to various regional post office boxes - Pt2
-- San Francisco : new address for Last Name L <= Z 
-- New York: use a colon instead of hyphen 
-- Reno: only Last Names 

sfOffice :: ([Char], [Char]) -> [Char]
sfOffice name = if lastName < "L"
                then nameText 
                ++ " - PO Box 1234 - San Francisco, CA, 94111"
                else nameText 
                ++ " - PO Box 1010 - San Francisco, CA, 94109"
  where lastName = snd name 
        nameText = (fst name)++" "++lastName 

nyOffice :: ([Char], [Char]) -> [Char]
nyOffice name = nameText ++ " : PO Box 789 - New York, NY, 10013"
  where nameText = (fst name)++" "++(snd name)

renoOffice :: (a, [Char]) -> [Char]
renoOffice name = nameText++" - PO Box 456 - Reno, NV 89523"
  where nameText = snd name

dcOffice :: (a, [Char]) -> [Char]
dcOffice name = nameText++" - PO Box 121 - Washington, DC 23056"
  where nameText = snd name ++ ", Esq"
-- How to use these 3 address functions w/addressLetter?

getLocationFunction :: [Char] -> ([Char], [Char]) -> [Char]
getLocationFunction location = case location of
  "ny" -> nyOffice -- if location is ny, returns nyOffice function
  "sf" -> sfOffice -- if location is sf, returns sfOffice function
  "reno" -> renoOffice --if location is reno, returns renoOffice function
  "dc" -> dcOffice --if location is wa, returns waOffice function
  _ -> (\name -> (fst name)++ " "++ (snd name)) -- underscore _ is wildcard : generic solution

-- addressLetter V.2 
addressLetter :: ([Char], [Char]) -> [Char] -> [Char]
addressLetter name location = locationFunction name 
  where locationFunction = getLocationFunction location 

-- Prelude> :l FirstClassFunctions.hs
-- [1 of 1] Compiling Main             ( FirstClassFunctions.hs, interpreted )
-- Ok, one module loaded.
-- *Main> addressLetter ("Bob","Jones") "ny"
-- "Bob Jones : PO Box 789 - New York, NY, 10013"
-- *Main> addressLetter ("Habib","Jones") "sf"
-- "Habib Jones - PO Box 1234 - San Francisco, CA, 94111"
-- *Main> addressLetter ("Beth","Tums") "reno"
-- "Tums - PO Box 456 - Reno, NV 89523"
-- *Main> addressLetter ("Tik","Tok") "la"
-- "Tik Tok"
