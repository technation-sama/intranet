class RepairMailer < ApplicationMailer

  default from: ENV['GMAIL_USERNAME']
  def new_repair(repair)
    @repair = repair
      mail( :to => ENV['ANALYTICS'],
            :subject => "New Maintainance Issue"
      )
  end
end
