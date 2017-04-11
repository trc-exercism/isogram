defmodule Isogram do
  @punctuation [?-, 32]
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean

  def isogram?(sentence) do
    _isogram(to_charlist(sentence), %{})
  end

  defp _isogram([], acc), do: acc
  defp _isogram([h|t], acc) when h in @punctuation, do: _isogram(t, acc)
  defp _isogram([h|t], acc) do
    cond do
      Map.has_key?(acc, h) -> false
      true -> _isogram(t, Map.merge(acc, %{h => true}))
    end
  end

end
