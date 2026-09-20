class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[ show edit update destroy ]

  def index
    @microposts = Micropost.all
  end

  def show
  end

  def new
    @micropost = Micropost.new
  end

  def edit
  end

  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @micropost.errors, status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: "Micropost was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @micropost.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @micropost.destroy!

    respond_to do |format|
      format.html { redirect_to microposts_path, notice: "Micropost was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_micropost
      @micropost = Micropost.find(params.expect(:id))
    end

    def micropost_params
      params.expect(micropost: [ :content, :user_id ])
    end
end
