# Preview all emails at http://localhost:3000/rails/mailers/repair_mailer
class RepairMailerPreview < ActionMailer::Preview

  def new_repair
    @repair = MaintainaceReport.new(user_id: "lirqoh@gmail.com",location: "C1 5th Floor",
      category: "Doors and Windows", description: "Cracked Tiles")

    RepairMailer.new_repair(@repair)
  end



end
