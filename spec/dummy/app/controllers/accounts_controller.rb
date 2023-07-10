class AccountsController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def show
  end

  private

  def set_user
    @user = current_user
  end
end
