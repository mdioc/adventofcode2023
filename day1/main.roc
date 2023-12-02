app "file-read"
    packages { pf: "https://github.com/roc-lang/basic-cli/releases/download/0.6.2/c7T4Hp8bAdWz3r9ZrhboBzibCjJag8d0IP_ljb42yVc.tar.br" }
    imports [
        pf.Stdout,
        "day1.txt" as day1 : Str
    ]
    provides [main] to pf

getFirst : List U8 -> U8
getFirst = \nums -> List.first nums |> Result.withDefault 48

getNumsFromLine : Str -> U32
getNumsFromLine = \line ->
    listNums = Str.toUtf8 line |> List.keepIf \item -> item < 58 && item > 47
    first = getFirst listNums
    last = List.reverse listNums |> getFirst
    [first, last]
    |> Str.fromUtf8
    |> Result.withDefault "0"
    |> Str.toU32 
    |> Result.withDefault 0

main =
    day1
    |> Str.split "\n"
    |> List.map \line -> getNumsFromLine line 
    |> List.sum
    |> Num.toStr
    |> Stdout.line
