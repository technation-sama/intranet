class RepairMailer < ApplicationMailer

  default from: 'intranet@nbo.samadc.org'
  def new_repair(repair)
    @repair = repair
      mail( :to => "victor.sang@nbo.samadc.org",
            :subject => "New Maintainance Issue"
      )
  end
end
