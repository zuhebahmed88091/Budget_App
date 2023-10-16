class TransactionDetailsController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @updated_transaction_details = @category.transaction_details.where(author_id: current_user)
      @total_amount = @updated_transaction_details.sum(:amount)
      @transaction_details = @updated_transaction_details.to_a
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @transaction_details = @user.transaction_details
    end
  end

  def new
    @transaction_detail = TransactionDetail.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @transaction_detail = current_user.transaction_details.build(transaction_detail_params)
    @category.transaction_details << @transaction_detail
    if @category.save
      redirect_to category_transaction_details_path(@category)
    else
      render 'new'
    end
  end

  private

  def transaction_detail_params
    params.require(:transaction_detail).permit(:name, :amount, :category_id, :author_id)
  end
end
