open System
open System.Windows.Forms
open System.Drawing
open System.IO
open System.Text

// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
//Создание формы
let form = new Form(Width= 400, Height = 230, Text = "F# Главная форма", Menu = new MainMenu())

//Создание элементов формы
let button = new Button(Text = "Найти!")
let textBox1 = new TextBox(Width = 340)
let textBox2 = new TextBox(Width = 340)
let label1 = new Label(Text = "Cписок:")
let label2 = new Label(Text = "Результат:")

//Задание местоположения элементов формы
button.Location <- new Point(147, 140)
textBox1.Location <- new Point (20, 40)
textBox2.Location <- new Point (20, 100)
label1.Location <- new Point (20, 20)
label2.Location <- new Point (20, 80)

//Добавление элементов на форму
form.Controls.Add(button)
form.Controls.Add(textBox1)
form.Controls.Add(textBox2)
form.Controls.Add(label1)
form.Controls.Add(label2)

let read_data (text:string) =
    let rec parse listStr parsedText =
        match listStr with
        | h::t -> let number = Convert.ToInt32((string) h)
                  parse t (List.append parsedText [number])
        | [] -> parsedText

    parse (List.ofArray (text.Split(' '))) []

let write_list (l) =
    let mutable gui_textOut = ""
    let _ = List.iter (fun x -> (gui_textOut <- gui_textOut + " " + x.ToString())) l
    textBox2.Text<-gui_textOut


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

let Click evArgs : unit =
    let rD = read_data textBox1.Text
    write_list (List.map (fun elem -> List.findIndex (fun el -> el = elem ) rD) (List.filter (fun elem -> (List.forall (fun el1 -> (sum el1)%(sum elem)=0) rD) && (List.forall (fun el2 -> List.exists (fun elem -> elem%el2=0) rD) (getDels elem))) rD))

//Добавление события для клика по кнопке
button.Click.Add(Click)

//Запуск формы
Application.Run(form)