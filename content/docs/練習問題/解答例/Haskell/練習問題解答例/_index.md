---
title: "練習問題解答例"
date: 2026-07-22T05:30:53+09:00
lastmod: 2026-07-22T05:30:53+09:00
slug: "練習問題解答例"
draft: false
---

変な処理があれば修正してください。

# ループ1 {#loop}
[問題文](/docs/練習問題#eb2c4338)

```
times 0 action = return ()
times n action = action >> times (n-1) action

main = do
    5 `times` putStrLn "Hello World!"
```

別解

```
main = putStr $ "おっぱい！" >> "Hello World!\n"
```


# ループ2 {#loop2}
[問題文](/docs/練習問題#eb2c4338)

```
import System.Environment

times 0 action = return ()
times n action = action >> times (n-1) action

main = do
    x <- getArgs
    (read (x !! 0)) `times` putStrLn "Hello World!"
```

回数も表示

```
import System.Environment
import Control.Monad
 
main :: IO ()
main = fmap (read . head) getArgs >>= \n -> forM_ [1..n] $ putStrLn . ("Hello World! "++) . show
```


# &#70;izzBuzz {#fizzbuzz}
[問題文](/docs/練習問題#t52e5a48)

```
main = do
    mapM_ putStrLn (map fizzBuzz [1..100])

fizzBuzz :: Integer -> String
fizzBuzz n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod`  5 == 0 = "Buzz"
    | n `mod`  3 == 0 = "Fizz"
    | otherwise       = show n
```

別解

```
fizzbuzz :: [String]
fizzbuzz = zipWith3 f [1..] fizz buzz
    where
      f i x y = if null x && null y then show i else x ++ y
      fizz = cycle ["", "", "Fizz"]
      buzz = cycle ["", "", "", "", "Buzz"]
 
fizzbuzz' :: [String]
fizzbuzz' = map f [1..]
    where
      f i = let x = g i in if null x then show i else x
      g x = concat [ s | (i, s) <- [(3, "Fizz"), (5, "Buzz")], mod x i == 0 ]
 
main :: IO ()
main = mapM_ putStrLn $ take 30 fizzbuzz
```


# 素数列挙 {#list-primes}
[問題文](/docs/練習問題#prime)

```
primesTo m = 2 : sieve [3, 5..m] where
    sieve [] = []
    sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p+2*p..m])

minus (x:xs) (y:ys) = case (compare x y) of
    LT -> x : minus xs (y:ys)
    EQ ->     minus xs ys
    GT ->     minus (x:xs) ys
minus xs _ = xs

main = do
    print $ primesTo (floor 1e6)
```


# うるう年判定 {#leap-year}
[問題文](/docs/練習問題#i0d67516)

```
isleap :: Integer -> Bool
isleap y
    | y `mod` 400 == 0 = True
    | y `mod` 100 == 0 = False
    | y `mod`   4 == 0 = True
    | otherwise        = False

main = do
    putStrLn "西暦を入力してください"
    x <- getLine
    putStrLn (x ++ "年はうるう年" ++ if isleap(read(x)) then "です" else "ではありません" )
```


# フィボナッチ数列 {#fib}
[問題文](/docs/練習問題#p59f794f)

```
import System.Environment

fibo = 0 : 1 : zipWith (+) fibo (tail fibo)

main = do
    x <- getArgs
    putStrLn (show (fibo !! read (x !! 0)))
```


# 累乗1 {#pow}
[問題文](/docs/練習問題#x6e30de3)

```
pow :: Integer -> Integer -> Integer
pow _ 0 = 1
pow 0 _ = 0
pow a b = a * pow a (b-1)

main = do
    putStrLn (show (pow 2 10))
```


# 累乗2 {#pow2}
[問題文](/docs/練習問題#x6e30de3)

```
pow :: Integer -> Integer -> Integer
pow 0 _ = 0
pow _ 0 = 1
pow a b = pow' 1 a b
    where
    pow' x a 0 = x
    pow' x a b
        | even b = pow' x (a*a) (div b 2)
        | otherwise = pow' (x*a) a (b-1)

main = do
    putStrLn (show (pow 2 1000007))
```


# クイックソート {#qsort}
[問題文](/docs/練習問題-アルゴリズム編-#qsort)

```
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort[a | a<-xs, a <= x]
        biggerSorted  = quicksort[a | a<-xs, a >  x]
     in smallerSorted ++ [x] ++ biggerSorted

main :: IO()
main = print $ quicksort [5, 7, 9, 2, 1, 3, 8, 4, 6, 0]
```


# 世界のナベアツ問題 {#nabeatsu}
[問題文](/docs/練習問題#t52a5a48)

```
nabeatsu :: Integer -> String
nabeatsu x = if mod x 3 == 0 || elem '3' s then "Aho" else s where s = show x

main :: IO ()
main = putStrLn . unwords $ map nabeatsu [1..100]
```


# Caesar暗号解読 {#caesar}
[問題文](/docs/練習問題#h54a0395)

```
import Data.List (isInfixOf)
 
next :: String -> Char -> Char
next (x:xs) = \c -> if x == c then head xs else next xs c
next _ = id
 
analyze :: String -> String
analyze = head . filter (isInfixOf keyword) . iterate (map $ next chars)
    where chars   = "-abcdefghijklmnopqrstuvwxyz .,-"
          keyword = "person"
 
main :: IO ()
main =  putStrLn $ analyze encoded
    where encoded = "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtq\
                    \i-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ib\
                    \tqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qsc\
                    \xmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgi\
                    \emgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj"
```


# 数当てゲーム {#guess-num}
[問題文](/docs/練習問題#guess-num)

```
import System.IO
import System.Random
import Control.Monad
 
game :: Int -> IO ()
game x = do
    us <- getLine
    case reads us of
        [(u, _)] -> when (x /= u) $ do
            putStrLn . ("too "++) . (++"!") $ if x < u then "big" else "small"
            game x
        _ -> putStrLn "invalid input!" >> game x
 
main :: IO ()
main = do hSetBuffering stdout NoBuffering
          putStrLn "input a number!"
          getStdGen >>= game . fst . randomR (1,100)
          putStrLn "right!"
```


# 配列いじり {#tweak-arr}
[問題文](/docs/練習問題#w5561ad6)

```
tailZero :: (Num a) => [a] -> [a]
tailZero = zipWith (*) (1 : repeat 0)
 
main :: IO ()
main = print $ tailZero [3,5,2,4,2]
```


# シェルピンスキーのギャスケット {#gasket}
[問題文](/docs/練習問題#w9c362ad)

```
import Control.Applicative
 
pascal :: [[Integer]]
pascal = [1] : map (zipWith (+) <$> ([0] ++) <*> (++ [0])) pascal
 
sierpinski :: Int -> String
sierpinski = unlines . map (map draw) . flip take pascal
    where draw x = if odd x then '*' else ' '
 
main :: IO ()
main = putStr $ sierpinski 32
```


# カレンダー出力 {#calendar}
[問題文](/docs/練習問題#i5e3e061)

```
import System.Environment
 
ff :: Int -> Int -> Int
ff y m
    | m < 3 = ff (y-1) (m+12)
    | otherwise = 365*y + (y`div`4) - (y`div`100) + (y`div`400) + ((306*(m+1))`div`10) - 428 + 1
 
calendar :: Int -> Int -> String
calendar y m
    | y < 1 || m < 1 || 12 < m = error "calendar"
    | otherwise = unlines . ("Su Mo Tu We Th Fr Sa":) . split7 $ map toStr calList
    where calList   = [1 - (ff y m) `mod` 7 .. ff y (m+1) - ff y m]
          toStr x   = if 0 < x  then sp x $ show x else "  "
          sp x      = if x < 10 then (' ':) else id
          split7 [] = []
          split7 xs = let (as, bs) = splitAt 7 xs in unwords as : split7 bs
 
main :: IO ()
main = fmap (map read) getArgs >>= \[y,m] -> putStr $ calendar y m
```


# ハノイの塔 {#hanoi}
[問題文](/docs/練習問題#hanoi)

```
import System.Environment
 
hanoi :: Integer -> a -> a -> a -> [(a, a)]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n-1) a c b ++ [(a,b)] ++ hanoi (n-1) c b a
 
main :: IO ()
main = do
    [x] <- fmap (map read) getArgs
    let f = \(i,(a,b)) -> putStrLn $ show i ++ ": " ++ a ++ "->" ++ b
    mapM_ f . zip [1..] $ hanoi x "A" "B" "C"
```


# 転置行列 {#transpose}
[問題文](/docs/練習問題#q9f27a17)

```
import Data.List (transpose)

```

# 英単語しりとりプログラム {#shiritori}
[問題文](/docs/練習問題#shiritori)

```
import System.IO
import System.Random
import Control.Monad
import qualified Data.Set as S
import qualified Data.Map as M
 
type User    = Bool
type Initial = Char
type Dict    = S.Set String
type Used    = M.Map String (Int, User)
 
game :: User -> Initial -> Dict -> Used -> IO ()
game user c dic used = do
    word <- if user then userInput c dic else randomSelect c dic used
    case word of
        [] -> putStrLn $ winMsg usedSize
        _  -> case M.lookup word used of
            Just (n, u) -> putStrLn $ loseMsg n u usedSize
            Nothing     -> game (not user) (last word) dic $ M.insert word (usedSize + 1, user) used
    where usedSize = M.size used
          winMsg n = "S: まいりました！あなたの勝ちです。今回のしりとりでは "
                     ++ show n ++ " 個の単語を使用しました。"
          loseMsg n u m = "S: その言葉は " ++ show n ++ " 回目に "
                          ++ (if u then "あなた" else "わたし") ++ " が使用しています。わたしの勝ちです。\
                          \今回のしりとりでは " ++ show m ++ " 個の単語を使用しました。"
 
userInput :: Initial -> Dict -> IO String
userInput c dic = do
    putStr "U: "
    s <- getLine
    if not (null s) && head s /= c
        then putStrLn ("S: " ++ [c] ++ "から初めてください") >> userInput c dic
        else if S.member s dic
                 then return s
                 else putStrLn "S: 辞書に存在しない単語です。" >> userInput c dic
 
randomSelect :: Initial -> Dict -> Used -> IO String
randomSelect c dic used = do
    gen <- getStdGen
    newStdGen
    let sub  = S.filter (\x -> head x == c && M.notMember x used) dic
        idx  = fst $ randomR (0, S.size sub - 1) gen
        word = if S.null sub then [] else S.toList sub !! idx
    when (word /= []) . putStrLn $ "S: " ++ word
    return word
 
start :: IO ()
start = do
    gen <- getStdGen
    content <- readFile "word.dic"
    let user = fst $ random gen
        inic = fst $ randomR ('a','z') gen
        dic  = S.fromList $ lines content
    when user . putStrLn $ "S: " ++ [inic] ++ "から初めてください"
    game user inic dic M.empty
 
main :: IO ()
main = hSetBuffering stdout NoBuffering >> hSetEncoding stdout utf8 >> start
```


# 線形合同法 {#lcg}
[問題文](/docs/練習問題#lcg)

```
import Data.Ratio

lcgs :: Integral a => a -> a -> a -> a -> [a]
lcgs a b m x | not st    = error "lcgs"
             | otherwise = x' : lcgs a b m x'
    where st = m > a && m > b && a > 0 && b >= 0
          x' = (a * x + b) `mod` m 

main :: IO ()
main = mapM_ (print . fromRational) xs >> putStr "avg = " >> print (fromRational avg)
    where a = 997; b = 1; m = 65536; x = 12345; n = 100
          xs  = take n . map (% m) $ lcgs a b m x
          avg = sum xs / fromIntegral n
```


# 配列から大きい要素とその添字を求めるプログラム {#n-largest}
[問題文](/docs/練習問題#u170a96a)

```
import Data.List (sortBy)
import Data.Function (on)

topThree :: [Int] -> [(Int,Int)]
topThree = take 3 . reverse . sortBy (on compare snd) . zip [0..]

main :: IO ()
main = mapM_ (putStrLn . f) . topThree $ [12,6,8,3,10,1,0,9]
    where f = \(i,x) -> show i ++ " -> " ++ show x
```


# 迷路を解くプログラム {#maze}
[問題文](/docs/練習問題#maze)

```
-- 参考ページ
-- Programming Praxis – Dijkstra’s Algorithm | Bonsai Code
-- <http://bonsaicode.wordpress.com/2011/01/04/programming-praxis-dijkstra%E2%80%99s-algorithm/>
 
import Control.Monad (replicateM)
import Data.Function (on)
import Data.List (delete, minimumBy)
import Data.Map ((!), fromList, fromListWith, adjust, keys, Map)
 
type Pos  = Int
type Cost = Int
 
dijkstra :: Pos -> Map Pos [(Pos, Cost)] -> Map Pos (Cost, Maybe Pos)
dijkstra source graph = let vs = keys graph in
    f (fromList [(v, (if v == source then 0 else maxBound, Nothing)) | v <- vs]) vs
    where f ds [] = ds
          f ds q  = f (foldr relax ds $ graph ! m) (delete m q)
              where m = minimumBy (on compare (ds!)) q
                    relax (e,d) = adjust (min (fst (ds ! m) + d, Just m)) e
 
build :: [Pos] -> Map Pos [(Pos, Cost)]
build = fromListWith (++) . map f
    where f r = let next = filter (\x -> 0 < x && x < 99) $ map (r+) [-1,1,-10,10]
                in  (r, zip next $ repeat 1)
 
shortestPath :: Pos -> Pos -> Map Pos [(Pos, Cost)] -> [Pos]
shortestPath from to graph = f to
    where f x = x : maybe [] f (snd $ dijkstra from graph ! x)
 
answer :: String -> String
answer mazeLine = drawPath
    where maze         = zip [0..] mazeLine
          road         = foldr (\(i,c) a -> if c == ' ' then i : a else a) [] maze
          [start,goal] = filter wall road
              where wall i = (0 < i && i < 9) || (90 < i && i < 99) || (elem i $ [0,10..90] ++ [9,19..99])
          path         = shortestPath start goal $ build road
          drawPath     = map (\(i,c) -> if elem i path then '+' else c) maze
 
main :: IO ()
main = mapM_ putStrLn . split10 . answer . concat =<< replicateM 10 getLine
    where split10 [] = []
          split10 xs = let (as, bs) = splitAt 10 xs in as : split10 bs
```


# ひらがな2文字をランダムで出力するプログラム {#two-hiragana}
[問題文](/docs/練習問題#s98f80e0)

```
import System.IO
import System.Random
 
main :: IO ()
main = hSetEncoding stdout utf8 >> getStdGen >>= putStrLn . take 2 . randomRs ('あ', 'ん')
```


# 平方根を求めてみる {#sqrt}
[問題文](/docs/練習問題#y8402045)

```
import Control.Arrow
 
sqrt' :: Fractional a => a -> a
sqrt' = snd . (!!111) . iterate (fst &&& (/2) . uncurry(+) . (snd &&& uncurry(/))) <<< id &&& id
 
main = print $ sqrt' 3
```
