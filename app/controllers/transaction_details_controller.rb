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
    @categories = current_user.categories.all
  end

  def create
    category_params = params[:transaction_detail][:category]
    name = params[:transaction_detail][:name]
    amount = params[:transaction_detail][:amount]

    @category = Category.find_by(name: category_params)
    @transaction_detail = current_user.transaction_details.build(name:, amount:)
    @category.transaction_details << @transaction_detail
    if @category.save
      redirect_to category_transaction_details_path(@category)
    else
      render 'new'
    end
  end

  private

  def transaction_detail_params
    params.require(:transaction_detail).permit(:name, :amount).merge(category: params[:transaction_detail][:category])
  end
end
