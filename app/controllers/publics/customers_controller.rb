class Publics::CustomersController < ApplicationController
  # before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end
  
  #登録情報へのアクション 
  def edit
  @customer = current_customer
end

  # 登録情報の編集を保存するアクション
def update
  @customer = current_customer
  if @customer.update(customer_params)
      flash[:notice] = "登録情報が更新されました。"
     redirect_to publics_customers_mypage
   else
     render 'edit'
   end
  end

# 退会アクション
def withdraw
   @customer = current_customer
   @customer.update(is_customer_status: true)
   reset_session
   flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
   redirect_to root_path
end


private
def customer_params
   params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postcode, :address, :phone_number, :is_valid, :reset_password_token, :password_confirmation, :is_customer_status)
 end
end
