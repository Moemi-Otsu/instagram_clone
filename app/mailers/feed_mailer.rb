class FeedMailer < ApplicationMailer
  def feed_mail(user)
    # @userは、user引数に入れられた情報をインスタンス変数に格納して、viewに値を渡せるようにしているだけ。
    @user = user
    mail to: "user.email", subject: "写真が投稿されました！"
  end
end
