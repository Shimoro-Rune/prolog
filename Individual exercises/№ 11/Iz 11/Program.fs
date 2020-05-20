// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.

open System
open System.Windows.Forms
open System.Drawing

let form = new Form(Width = 400, Height = 230, Text = "F# Program")


let button = new Button(Text = "Вычислить")
let textBox1 = new TextBox()
let textBox2 = new TextBox()
let textBox3 = new TextBox(Width = 130)
let comboBox1 = new ComboBox(Width = 70)
let label1 = new Label(Text = "Первое число")
let label2 = new Label(Text = "Второе число")
let label3 = new Label(Text= "Ответ")

button.Location <- new Point(147, 80)
textBox1.Location <- new Point (20, 40)
textBox2.Location <- new Point (250, 40)
textBox3.Location <- new Point (20, 150)
comboBox1.Location <- new Point (150, 40)
label1.Location <- new Point (20, 20)
label2.Location <- new Point (250, 20)
label3.Location <- new Point (20, 130)

comboBox1.Items.Add("+") |>ignore
comboBox1.Items.Add("-") |>ignore
comboBox1.Items.Add("*") |>ignore
comboBox1.Items.Add("/") |>ignore

form.Controls.Add(button)
form.Controls.Add(textBox1)
form.Controls.Add(textBox2)
form.Controls.Add(textBox3)
form.Controls.Add(comboBox1)
form.Controls.Add(label1)
form.Controls.Add(label2)
form.Controls.Add(label3)

//button.Click.Add(fun evArgs -> MessageBox.Show("Click me") |> ignore)

let Click evArgs : unit =
    if textBox1.Text.Length>0 && textBox2.Text.Length>0 then
        let x = System.Double.Parse(textBox1.Text)
        let y = System.Double.Parse(textBox2.Text)
        if (comboBox1.SelectedIndex = 0) then
            textBox3.Text <- System.Convert.ToString(x+y)
        else
            if (comboBox1.SelectedIndex = 1) then
                textBox3.Text <- System.Convert.ToString(x-y)
            else
                if (comboBox1.SelectedIndex = 2) then
                    textBox3.Text <- System.Convert.ToString(x*y) 
                else
                    if (comboBox1.SelectedIndex = 3) then
                        if y<>0.0 then
                            let z=x/y
                            textBox3.Text <- System.Convert.ToString(z)
                        else
                            MessageBox.Show("На 0 делить нельзя!", "Внимание!") |> ignore
                    else
                        MessageBox.Show("Выберите знак!", "Внимание!") |> ignore
    else
        MessageBox.Show("Введите числа!", "Внимание!") |> ignore

button.Click.Add(Click)

Application.Run(form)