class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :update_index, :edit_basic_info, :destroy,:overtime_request]
  before_action :logged_in_user, only: [:show, :update, :update_index, :destroy, :edit_basic_info]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy,:index, :edit_basic_info, :working]
  before_action :set_one_month, only: :show
  before_action :admin_not, only: [:show,:verifacation]
  before_action :correct_not, only: [:show]

  
  def index
    @users = User.where.not(id: 1).search(params[:search]).paginate(page: params[:page], per_page: 5)
    
  end


  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
    @superior = User.where(superior: true).where.not( id: current_user.id  )
   
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

   def import
    if params[:file].blank?
      flash[:danger]= "csvファイルを選択して下さい"
      redirect_to users_url
    elsif
      File.extname(params[:file].original_filename) != ".csv"
      flash[:danger]= "csvファイル以外は出力できません"
      redirect_to users_url
    else
      User.import(params[:file])
      flash[:success]= "インポートが完了しました"
      redirect_to users_url
    end 
   
   rescue ActiveRecord::RecordInvalid
    flash[:danger]= "不正なファイルのため、インポートに失敗しました"
    redirect_to users_url
   rescue ActiveRecord::RecordNotUnique
    flash[:danger]= "既にインポート済です"
    redirect_to users_url
   end
  def edit
  end

   def working 
    # ユーザーモデルから全てのユーザーに紐づいた勤怠たちを代入
    @users = User.all.includes(:attendances).where.not(id: 1)
   end 
   
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end
  
  def update_index
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      flash[:danger] = "更新に失敗しました。"
      redirect_to users_url
    end 
  end 

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_basic_info
    
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      flash[:success] = "#{@user.name}の基本情報を更新しました。"
    else
      flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def verifacation
    @user = User.find(params[:id])
    if @user.id == 1
       flash[:danger] = "閲覧できません"
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :affiliation,:employee_number,:uid, :password, 
        :password_confirmation, :basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end

    def basic_info_params
      params.require(:user).permit(:affiliation, :basic_time, :work_time)
    end
    
     # システム管理権https://so-zou.jp/web-app/text/fullwidth-halfwidth/限所有かどうか判定します。
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
    
    def admin_not
      redirect_to root_url if current_user.admin?  
    end
    
      # 管理権限者、または現在ログインしているユーザーを許可します。
    def admin_or_correct
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
end
