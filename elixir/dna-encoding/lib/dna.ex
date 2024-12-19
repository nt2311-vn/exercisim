defmodule DNA do
  alias String.Unicode

  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      ?\s -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    encode(dna, <<>>)
  end

  defp encode([], encoded), do: encoded

  defp encode([head | tail], encoded) do
    new_encode =
      case head do
        ?\s -> <<encoded::bitstring, 0::size(4)>>
        ?A -> <<encoded::bitstring, 1::size(4)>>
        ?C -> <<encoded::bitstring, 2::size(4)>>
        ?G -> <<encoded::bitstring, 4::size(4)>>
        ?T -> <<encoded::bitstring, 8::size(4)>>
      end

    encode(tail, new_encode)
  end

  def decode(<<>>), do: []

  def decode(<<val::size(4), rest::bitstring>>) do
    char =
      case val do
        0 -> ?\s
        1 -> ?A
        2 -> ?C
        4 -> ?G
        8 -> ?T
      end

    [char | decode(rest)]
  end
end
