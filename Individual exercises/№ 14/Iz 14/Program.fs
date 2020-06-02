open System
open System.Linq
open System.Linq

// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
let maxSubstr (x:string) (y:string) n m =
    let matrix = Array2D.zeroCreate<int> 1000 1000
    for i=1 to n-1 do
        for j=1 to m-1 do
            if x.[i]=y.[j] then
                matrix.[i, j] <- 1+matrix.[i-1,j-1]
            else
                matrix.[i,j] <- 0
    let mutable ans = 0
    let mutable u=0
    let mutable v=0
    for i=1 to n-1 do
        for j=1 to m-1 do
            ans <- Math.Max(ans,matrix.[i,j])
            u <- i
            v <- j
    let mutable s=""
    for i=0 to ans do
        s <- s+x.[u-ans+i].ToString()
    s


[<EntryPoint>]
let main argv = 
    let x="SUBSEQUENCE"
    let y="SUBEUENCS"
    let n=x.Length
    let m=y.Length
    Console.WriteLine(maxSubstr x y (n) (m))

    let z=Console.ReadKey()
    0 // return an integer exit code
