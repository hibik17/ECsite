class CustomersController < ApplicationController
  def show

  end

  def edit
    @end_user=current_end_user
  end

  def update
    @end_user=current_end_user
    if @end_user.update(end_user_params)
      redirect_to customers_path
      flash[:notice]="会員情報を更新しました"
    else
      render :edit
    end
  end

  def confirm
    @end_user=current_end_user
  end

  def unsubscribed
    end_user=current_end_user
    end_user.update(is_unsubscribed: true)
    # session_reset→ログアウトする
    reset_session
    flash[:notice]="ありがとうございました。またのご利用を心よりお待ちしています。"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:first_name,:family_name,:first_name_kana,:family_name_kana,:email,:zip_code,:address,:phone_number,:is_unsubscribed)
  end
end
