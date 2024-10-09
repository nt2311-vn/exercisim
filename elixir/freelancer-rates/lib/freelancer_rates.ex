defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    before_discount = hourly_rate * 8 * 22
    trunc(Float.ceil(apply_discount(before_discount, discount), 0))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget * 22 / monthly_rate(hourly_rate, discount), 1)
  end
end
