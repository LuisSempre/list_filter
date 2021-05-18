defmodule ListFilter do
  def call(list), do: filter(list)

  defp filter(list) do
    list
    |> get_numeric_items
    |> get_odd_numbers
  end

  defp get_numeric_items(list), do: Enum.map(list, fn item -> validate_number(item) end)

  defp validate_number(item) do
    regex = Regex.compile!("^[0-9]*$")

    with true <- Regex.match?(regex, item) do
      String.to_integer(item)
    else
      _ -> 0
    end
  end

  defp get_odd_numbers(numeric_items) do
    Enum.filter(numeric_items, fn item -> odd_number(item) end)
  end

  defp odd_number(item) when rem(item, 2) == 0, do: nil
  defp odd_number(item) when rem(item, 2) != 0, do: item
end
