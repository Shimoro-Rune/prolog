open System

// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

let read_data=
    let rec read_list n=
        if n=0 then []
        else
        let Head = System.Convert.ToInt32(System.Console.ReadLine())
        let Tail = read_list(n-1)
        Head::Tail
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let findCount list elem =
    let rec fC list elem count =
        match list with
        |[] -> count
        |h::t -> if h=elem then fC t elem (count+1)
                           else fC t elem count
    fC list elem 0

let rec write_list (list:int list) =
    match list with
    |[] -> let z=System.Console.ReadKey()
           0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t

let prime n =
    let rec isprime n m =
        if n=m then true
        else
            if n%m = 0 then false
            else isprime n (m+1)
    match n with
    |1->false
    |2->true
    |_->isprime n 2


let Iz14 list =
    let rec F list newL =
        let Del x newList =
            let rec D x d nL=
                match d with
                |1 -> nL
                |_ -> if x%d=0 && prime d && findCount nL d = 0 then let n=nL@[d]
                                                                     D x (d-1) n
                                                                else D x (d-1) nL
            match x with
            |0 -> newList
            |1 -> newList
            |_ -> D x x newList

        match list with
        |[] -> newL
        |head::tail -> let n=newL@[Del head newL]
                       F tail n
    F list []

[<EntryPoint>]
let main argv = read_data |> Iz14 |> write_list

