defmodule Kit.String do
  def dedent(string) do
    lines = String.split(string, "\n")

    min_indent =
      lines
      |> Enum.filter(&(!is_all_whitespace(&1)))
      |> Enum.map(&indent_size(&1, 0))
      |> Enum.min()

    lines
    |> Enum.map(fn x ->
      String.slice(x, min_indent..-1//1)
    end)
    |> Enum.join("\n")
  end

  defp indent_size(text, size) do
    case text do
      " " <> rest -> indent_size(rest, size + 1)
      "\t" <> rest -> indent_size(rest, size + 1)
      _ -> size
    end
  end

  defp is_all_whitespace(str) do
    str
    |> String.trim()
    |> Kernel.==("")
  end
end
