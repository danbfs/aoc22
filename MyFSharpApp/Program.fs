let input = "30373
25512
65332
33549
35390"

let rows = input.Split '\n'
let columns = rows[0] |> String.mapi(fun i tree -> rows[i][0])


input.Split '\n'
|> Array.mapi(fun maini x -> x |>
String.mapi(fun i c ->
if i = 0 or i = x.Length - 1 
then c
else System.Char.MinValue)
)




// List.map (treated, fun x -> x)
