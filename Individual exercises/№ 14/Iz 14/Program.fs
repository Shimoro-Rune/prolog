open System
open System.Linq
open System.Linq
open System.Windows.Forms
open System.Drawing
open System.IO
open System.Text
open System.Threading
[<STAThreadAttribute>]
    do

//Создание формы
let form = new Form(Width= 400, Height = 230, Text = "F# Главная форма", Menu = new MainMenu())


//Создание элементов формы
let button = new Button(Text = "Найти!")
let textBox1 = new TextBox(Width = 340)
let textBox2 = new TextBox(Width = 340)
let label1 = new Label(Text = "Первая строка")
let label2 = new Label(Text = "Вторая строка")

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

// Возвращает общую подстроку максимальной длины
let maxSubstr (x:string) (y:string) n m =
    let matrix = Array2D.zeroCreate<int> 1000 1000
    for i=1 to n do
        for j=1 to m do
            if x.[i-1]=y.[j-1] then
                matrix.[i, j] <- 1+matrix.[i-1,j-1]
            else
                matrix.[i,j] <- 0
    let mutable ans = 0
    let mutable u=0
    let mutable v=0
    for i=1 to n do
        for j=1 to m do
            if matrix.[i,j] > ans then
                ans <- Math.Max(ans,matrix.[i,j])
                u <- i
                v <- j
    let mutable s=""
    for i=1 to ans do
        s <- s+x.[u-ans+i-1].ToString()
    s

// Событие по клику кнопки
let Click evArgs : unit =
    let x=textBox1.Text
    let y=textBox2.Text
    let n=x.Length
    let m=y.Length
    let s = maxSubstr x y n m
    let saveAsDocument = new SaveFileDialog()
    saveAsDocument.Title = "Сохранить документ как..." |> ignore
    saveAsDocument.FileName = "Текстовый документ" |> ignore
    saveAsDocument.Filter = "Текстовые файлы (*.txt) |*.txt| Все файлы (*.*)|*.*" |> ignore
    if (saveAsDocument.ShowDialog() = DialogResult.OK) then
        //Создаем файл по пути, выбранному в окне сохранения
        let file = new FileStream(saveAsDocument.FileName, FileMode.Create, FileAccess.Write);
        let writer = new StreamWriter(file, Encoding.Default);
        writer.Write(s); //записываем содержимое в файл
        writer.Close(); //закрываем поток
        MessageBox.Show("Результат был успешно записан в файл!", "Поздравляем!") |>ignore

//Добавление события для клика по кнопке
button.Click.Add(Click)

//Запуск формы
Application.Run(form)
