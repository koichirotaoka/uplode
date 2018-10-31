class BlogMailer < ApplicationMailer
  def blog_mail(blog, current_user)
    @blog = blog
    mail to: current_user.email, subject: "ブログ投稿しました"
  end
end
