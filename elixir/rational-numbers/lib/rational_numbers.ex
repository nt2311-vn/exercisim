defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a1, a2} = a
    {b1, b2} = b

    {a1 * b2 + a2 * b1, a2 * b2} |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, a2} = a
    {b1, b2} = b

    {a1 * b2 - a2 * b1, a2 * b2} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, a2} = a
    {b1, b2} = b

    {a1 * b1, a2 * b2} |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, a2} = num
    {b1, b2} = den

    {a1 * b2, a2 * b1} |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, a2} = a
    {Kernel.abs(a1), Kernel.abs(a2)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, a2} = a

    cond do
      n >= 0 -> {Integer.pow(a1, n), Integer.pow(a2, n)} |> reduce()
      true -> {Integer.pow(a2, -n), Integer.pow(a1, -n)} |> reduce()
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a1, a2} = n
    :math.pow(x, a1 / a2)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {a1, a2} = a
    gcd = Integer.gcd(a1, a2)

    cond do
      a2 < 0 -> {-a1 / gcd, -a2 / gcd}
      true -> {a1 / gcd, a2 / gcd}
    end
  end
end
