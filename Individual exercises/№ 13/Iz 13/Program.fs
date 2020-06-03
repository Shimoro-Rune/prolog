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

let rec write_list (list:int list) =
    match list with
    |[] -> let z=System.Console.ReadKey()
           0
    |h::t -> System.Console.Write(h.ToString())
             System.Console.Write(" ")
             write_list t

let sum el =
    let rec s el summa =
        match el with
        |0 -> summa
        |_-> s (el/10) (summa+el%10)
    s el 0

let getDels el =
    let rec gD el list d =
        match d with
        |1 -> list
        |_ -> if (el%d=0) then let n=list@[d]
                               gD el n (d-1)
                          else gD el list (d-1)
    gD el [] el

[<EntryPoint>]
let main argv = write_list (List.map (fun elem -> List.findIndex (fun el -> el = elem ) read_data) (List.filter (fun elem -> (List.forall (fun el1 -> (sum el1)%(sum elem)=0) read_data) && (List.forall (fun el2 -> List.exists (fun elem -> elem%el2=0) read_data) (getDels elem))) read_data))