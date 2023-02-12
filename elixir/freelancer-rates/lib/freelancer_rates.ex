defmodule FreelancerRates do
  defp days_in_month, do: 22

  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(days_in_month() * daily_rate(hourly_rate), discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget * days_in_month() / monthly_rate(hourly_rate, discount), 1)
  end
end
