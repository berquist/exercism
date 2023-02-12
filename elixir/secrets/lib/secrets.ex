defmodule Secrets do
  def secret_add(secret) do
    fn to_add ->
      to_add + secret
    end
  end

  def secret_subtract(secret) do
    fn to_subtract_from ->
      to_subtract_from - secret
    end
  end

  def secret_multiply(secret), do: fn to_multiply -> to_multiply * secret end

  def secret_divide(secret), do: &floor(&1 / secret)

  def secret_and(secret), do: &Bitwise.band(&1, secret)

  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  def secret_combine(secret_function1, secret_function2) do
    &secret_function2.(secret_function1.(&1))
  end
end
