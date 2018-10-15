class PublicationsController<ApplicationController
  def index
    @publications=Publication.paginate(page:params[:page],per_page:4)
  end
  def  show
  @publication=Publication.find(params[:id])
  end
  def new
  @publication=Publication.new
  end
  def create
    @publication=Publication.new(publication_params)
    @publication.user=User.first
    if @publication.save
      flash[:success]="Les informations on bien ete ajouter a notre travail"
      redirect_to publication_path @publication
    else
      render 'new'
    end
  end
  def edit
  @publication=Publication.find(params[:id])
  end
  def update
    @publication=Publication.find(params[:id])
    if @publication.update(publication_params)
      flash[:success]="le travail a ete bien fait"
      redirect_to publication_path @publication
    else
      render "edit"
    end
  end

  def destroy
  Publication.find(params[:id]).destroy
  flash[:success] = "La publication a ete efface avec success"
    redirect_to publications_path
  end
  private
  def publication_params
    params.require(:publication).permit(:name,:description)
  end
end