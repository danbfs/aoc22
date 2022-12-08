defmodule Day7 do
  def read_system do
   input = "$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k"

input
|> String.split("\n")
|> Enum.reduce(%{:cd => "", :dirs => %{}, :hier => %{}}, fn x, acc ->
  cd = acc.cd
  dirs = acc.dirs
  hier = acc.hier

  new_cd = if String.contains?(x, "cd") do
    String.split(x, " ")
    |> List.last
  else cd
  end

  key = String.to_atom(new_cd)
  new_hier = if String.starts_with?(x, "dir") do
    dir = String.split(x, " ")
    |> List.last
    |> String.to_atom
    if is_map(hier) and !Map.has_key?(hier, key) do
      Map.put(hier, key, [dir])
    else
        %{hier | key => Map.get(hier, key) ++ [dir]}
    end
  else hier
  end

  if new_cd == ".." do
    %{:cd => cd, :dirs => dirs, :hier => new_hier}
  else

    new_dirs = if Map.has_key?(dirs, key) do
      file = String.split(x, " ")
      |> List.first
      if String.match?(file, ~r/[0-9]+/) do
         %{dirs | key => Map.get(dirs, key) ++ [String.to_integer(file)]}
      else
        dirs
      end
    else
      Map.put(dirs, key, [])
    end



  %{:cd => new_cd, :dirs => new_dirs, :hier => new_hier}
end
end)

# Map.keys(structure.dirs)
# |> Enum.map(fn dir ->
#   Enum.sum(Map.get(structure.dirs, dir))
  #   if Map.has_key?(structure.hier, dir) do
  #   Map.get(structure.hier, dir)
  #   |> Enum.map(fn y -> if Map.has_key?(structure.hier, y) do
  #     Enum.sum(Map.get(structure.dirs, y))
  #   else
  #     Enum.sum(Map.get(structure.dirs, y))
  #   end
  # end)
  # end
# end)
end

  def recur(system, dir) do
    if Map.has_key?(system.hier, dir) do
      a = Map.get(system.hier, dir)
      |> Enum.map(fn y -> recur(system, y) end)
      |> Enum.sum
      b = Enum.sum(Map.get(system.dirs, dir))
      a + b
    else
      Enum.sum(Map.get(system.dirs, dir))
    end
  end

  def recursive_sum(system) do
    Map.keys(system.dirs)
    |> Enum.map(fn dir ->
    {dir, recur(system, dir)}
  end)

  end

end

Day7.read_system
|> Day7.recursive_sum
|> Enum.filter(fn x ->
  size = elem(x, 1)
  size <= 100_000
end)
|> Enum.map(fn y -> elem(y, 1) end)
|> Enum.sum
