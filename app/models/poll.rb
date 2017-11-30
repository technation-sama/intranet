class Poll < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates_presence_of :user_id,:message => "You Must select name of the person to vote for!" 
  validates_presence_of :body, :message => "Reason for voting must be provided!" 
  validates_presence_of :project_name,:message => " Sorry, Please select a project to vote!" 
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
