class EmailsController < ApplicationController
  require "gmail"

  def index
    @emails= Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new()
  end

  def edit
    @email=Email.find(params[:id])
  end

  def create
    @email=Email.create(email_params)
    if @email.save
      if(@email.purpose=='Request')
      @email.update(body:"<h2>#{@email.name}様</h2>

      突然のメールにて失礼いたします。
      
      このたびは、貴社に勤務されている先輩を
      ご紹介いただきたく連絡させていただきました。
      
      私は、専門に研究しております。
      これまでの研究で学んだを活かし、
      分野での就職を希望しております。
      
      業界研究を行うなかで、
      貴社の分野に非常に興味を持ちました。
      貴社のことをもっと深く研究したいと考えております。
      
      ぜひ、先輩と直接お話しさせていただき
      貴社への理解を深めたいと思っております。
      
      突然のご相談で恐縮ですが
      ご検討いただけますと幸いです。
      
      よろしくお願いいたします。")
      elsif(@email.purpose=='Sales')
        @email.update(body:"<h2>#{@email.name}様</h2>
        いつもお世話になっております。
        
        先月分のご請求書についてご連絡です。
        
        御社から先月分のご請求書がまだ届いておりませんので
        念のため確認のメールをさせていただきました。
        
        事務処理の関係上、恐れ入りますが
        までに送付いただけますでしょうか。
        
        この日を過ぎると御社へのご入金が遅れる可能性がありますので
        よろしくお願いいたします。
        
        なお、本メールと行き違いになっている場合は
        なにとぞご容赦ください。
        
        それでは今後ともよろしくお願いいたします。
        ")
      end
      redirect_to @email
    else
      redirect_to new_email_path
    end

  end

  def send_email
    @email=Email.find(params[:email_id])
    TransemailMailer.email(@email).deliver
  end

  private
  def email_params
    params.require(:email).permit(:to,:subject,:body,:purpose,:whom,:name)
  end

end
