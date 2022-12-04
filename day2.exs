defmodule ElvishRPS do
  @rock 1
  @paper 2
  @scissors 3

  @loss 0
  @draw 3
  @win 6

  def first_round(input) do
    games = String.split(input, "\n")

    games
    |> Enum.map(fn e ->
    case e do
      "A X" -> @rock + @draw
      "A Y" -> @paper + @win
      "A Z" -> @scissors + @loss
      "B X" -> @rock + @loss
      "B Y" -> @paper + @draw
      "B Z" -> @scissors + @win
      "C X" -> @rock + @win
      "C Y" -> @paper + @loss
      "C Z" -> @scissors + @draw
    end
    end
    )
    |> Enum.sum()
  end

  def second_round(input) do
    games = String.split(input, "\n")

    games
    |> Enum.map(fn e ->
    case e do
      "A X" -> @scissors + @loss
      "A Y" -> @rock + @draw
      "A Z" -> @paper + @win
      "B X" -> @rock + @loss
      "B Y" -> @paper + @draw
      "B Z" -> @scissors + @win
      "C X" -> @paper + @loss
      "C Y" -> @scissors + @draw
      "C Z" -> @rock + @win
    end
    end
    )
    |> Enum.sum()
  end
end
