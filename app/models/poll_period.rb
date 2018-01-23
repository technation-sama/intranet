class PollPeriod < ApplicationRecord
  scope :current_poll_period, -> {
    where(period: 1.month.ago.strftime("%B") << 1.month.ago.strftime("%Y"))
   }
   
  scope :is_poll_period_open, -> {
    where(period: 1.month.ago.strftime("%B") << 1.month.ago.strftime("%Y"), active: true)
   }
end
