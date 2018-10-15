class UserController < ApplicationController
  def Hello
  end
  def login
    @user=User.new
  end
  def inscription

  end
  def about

  end
  def create
      @user=User.find_by(email: params[:user][:email].downcase)
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]=@user.id
      cookies.signed[:user_id]=@user.id
      flash[:success] = "Vous etes bien connecter ah #{@user.id}"
      redirect_to publications_path
    else
      flash[:danger]="Le mot de passe ou l'email nest pas permit"
      redirect_to login_path
    end
  end
  def destroy
  session[:user_id]=nil
    flash[:success]="Deconnexion reussi"
    redirect_to 'login'
  end

end
