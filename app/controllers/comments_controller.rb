class CommentsController <ApplicationController
  before_action :require_user
  def index

  end
  def show

  end
  def create
  @publicaion=Publication.find(params[:publication_id])
    @comments=@publicaion.comments.build(comment_params)
    @comments.user=current_user
    if @comments.save
      render  "allade fabien"
    else
      render "fabien le bon "
    end
  end
  def destoy

  end
  def delete

  end
  private
  def comment_params

  end
end