class UsersController<ApplicationController
  def  new
    @user=User.new
  end
def index
  @users=User.paginate(page:params[:page],per_page:1)
end
  def show
    @user=User.find(params[:id])
  end
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Les informations on bien ete ajouter a notre travail"
      render 'user/login'
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name,:company,:email,:password,:password_confirmation)
  end
end