require 'rest_client'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => :upload
  skip_before_filter :verify_authenticity_token  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    p 000000000000000000
    #response = RestClient.get 'http://localhost:3000/users/upload'
    RestClient.post('http://localhost:3000/users/upload',
                :image => File.new('/home/wyl/1.jpg'))
    p 11111111111111111111111111111
    reponse = request.to_s
    p reponse
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload
     p 22222222222222222
     #File.open(upload_path, 'wb') do |f|
     # f.write request.raw_post
     #end

     render :layout=>false,:template=>false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :sex)
    end
   
    def upload_path
       File.join(Rails.root,'public','1.jpg')
    end
end
