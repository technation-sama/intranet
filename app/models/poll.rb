class Poll < ApplicationRecord
  belongs_to :user, counter_cache: true, dependent: :destroy
  validates :user_id, :body, :project_name, presence: true
  @@period= Date.today.strftime("%B") << Date.today.strftime("%Y")
  
  def self.ransackable_scopes(_auth_object = nil)
    [:current_month]
  end 
  
  def after_save
   self.update_counter_cache
  end
  
  def after_destroy
    self.update_counter_cache
  end

  def update_counter_cache
    self.user.polls_count = Poll.count( :conditions => ["period = @@period AND user_id = ?",self.user.id])
    self.user.save
  end
  
  scope :current_month, -> {
    where(period: @@period)
  }
end
