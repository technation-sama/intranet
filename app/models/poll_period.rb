class PollPeriod < ApplicationRecord
   @@period= Date.today.strftime("%B") << Date.today.strftime("%Y")
  scope :current_poll_period, -> {
    where(period: @@period)
   }
  scope :is_poll_period_open, -> {
    where(period: @@period, active: true)
   }
end
