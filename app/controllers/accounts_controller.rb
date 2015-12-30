class AccountsController < ApplicationController

  before_action :require_login
  before_action :get_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to @account, notice: "Account created."
    else
      render :new, notice: "Could not create account."
    end
  end

  def edit
  end

  def update
    if @account.update_attributes(account_params)
      redirect_to @account, notice: "Account updated."
    else
      render :new, notice: "Could not update account."
    end
  end

  def destroy
    if @account.delete
      redirect_to accounts_path, notice: "Account deleted."
    else
      redirect_to accounts_path, notice: "Could not be deleted."
    end
  end

  private

  def get_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :email)
  end
end
