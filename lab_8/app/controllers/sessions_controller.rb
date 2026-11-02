class SessionsController < ApplicationController
  def new
  end

  def create
    render "new", status: :unprocessable_content
  end

  def destroy
  end
end
