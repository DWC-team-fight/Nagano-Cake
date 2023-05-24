class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

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
      redirect_to public_customers_mypage_path
    else
      render :edit
    end
  end


  def check
  end

  def withdrawal
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
     redirect_to root_path
  end


  private
      def customer_params
          params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal, :address, :phone_number, :is_customer_status)
      end
end
