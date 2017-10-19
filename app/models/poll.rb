class Poll < ApplicationRecord
  belongs_to :user, counter_cache: true, dependent: :destroy
  validates :user_id, :body, :project_name, presence: true

  def after_save
   self.update_counter_cache
  end

def after_destroy
  self.update_counter_cache
end

def update_counter_cache
  period= Date.today.strftime("%B")<<Date.today.strftime("%Y")
  self.user.polls_count = Poll.count( :conditions => ["period = period AND user_id = ?",self.user.id])
  self.user.save
end
end
