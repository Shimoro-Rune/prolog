// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

open System

//Подсчет суммы цифр в числе
let rec sumDigits a =
    match a with
    |0->0
    |_-> (sumDigits (a/10)) + (a%10)

//Проверка на простоту
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

//Сколько раз цифра встречается в числе
let rec Count i x k =
    if x<>0 then
        if x%10 = i then
            Count i (x/10) (k+1)
        else
            Count i (x/10) k
    else
        k

//Проверка на то, что число состоит из цифр от 1 до n без повторов
let rec HasDifDigits n i x =
    if i<=n then
        if Count i x 0 <>1 then
            false
        else HasDifDigits n (i+1) x
    else
        true

//Генерация наибольшего числа, состоящего из цифр от 1 до n без повторов
let rec GenerateStart n i k max =
    if i<=n then
        GenerateStart n (i+1) (k*10) (max+i*k)
    else
        max

//Генерация наименьшего числа, состоящего из цифр от 1 до n без повторов
let rec GenerateEnd n k min =
    if n>0 then
        GenerateEnd (n-1) (k*10) (min+n*k)
    else
        min

//Генерация требуемого числа
let rec GenerateNumb sumD max min n =
    let sum = sumDigits max
    if (prime max = true && sum = sumD && HasDifDigits n 1 max) then //Проверка на простоту, соответствие суммы цифр и содержание только цифр от 1 до n без повторов
        max
    else
        if (max-1)>min then //Проверка, не вышли ли мы за заданные границы, если вышли - значит, искомое число не существует
            GenerateNumb sumD (max-9) min n
        else
            0

let MaxPandPrime n =
    let max = GenerateStart n 1 1 0
    let min = GenerateEnd n 1 0
    let sumD = sumDigits max
    let newMax = GenerateNumb sumD max min n
    newMax


[<EntryPoint>]
let main argv =
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    let number = MaxPandPrime n
    if number <> 0 then
        printf "Ответ: "
        System.Console.Write(number)
    else
        printf "Такое n-пандигитальное простое число не существует"
    let b=System.Console.ReadKey()
    0