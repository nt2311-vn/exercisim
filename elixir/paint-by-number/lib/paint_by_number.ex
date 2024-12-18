defmodule PaintByNumber do
  def palette_bit_size(color_count), do: palette_bit_size(color_count, 0)

  def palette_bit_size(color_count, bits) do
    cond do
      Integer.pow(2, bits) >= color_count -> bits
      true -> palette_bit_size(color_count, bits + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    color_size = palette_bit_size(color_count)

    cond do
      picture == <<>> -> <<pixel_color_index::size(color_size)>>
      true -> <<pixel_color_index::size(color_size), picture::bitstring>>
    end
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    color_size = palette_bit_size(color_count)
    <<val::size(color_size), _rest::bitstring>> = picture

    val
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    color_size = palette_bit_size(color_count)
    <<_val::size(color_size), rest::bitstring>> = picture
    <<rest::bitstring>>
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
