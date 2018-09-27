class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: "koichirotaoka@gmail.com", subject: "作成完了メール"
  end
end
