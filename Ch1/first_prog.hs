import           System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Who is the email for? "
  recipient <- getLine
  putStr "What is your website url? "
  url <- getLine
  putStr "Who is the author? "
  author <- getLine
  putStrLn (createEmail recipient url author)

-- These are functions that help organize the email program
toPart recipient = "Dear " ++ recipient ++ ",\n"

bodyPart website = "Please take a look at my website: (" ++ website ++ ").\nI believe I am a strong candidate for your company.\n"

fromPart author = "Sincerely,\n" ++ author

createEmail recipient website author =
  toPart recipient ++ bodyPart website ++ fromPart author