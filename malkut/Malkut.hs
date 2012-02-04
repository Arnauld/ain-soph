--
-- 
--
import System.Environment
 
-- | 'main' runs the main program
main :: IO ()
main = getArgs >>= print . woot . head
 
woot s = "Hey! " ++ s

