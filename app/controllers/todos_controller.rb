class TodosController < ApplicationController
  def  new
    @todo=Todo.new
  end
  def create
   @todo=Todo.new(todo_params)
   if @todo.save
     flash[:notice]="Le trucs a ete bien ajouter comme il le fallait"
     redirect_to todo_path @todo
   else
     render 'new'
   end
  end
  def index
     @todo=Todo.all
  end
  def destroy
    @todo=Todo.find(params[:id])
    @todo.destroy
    flash[:notice] ="le travail aete bien fait"
    redirect_to todos_path
  end

  def show
      @todo=Todo.find(params[:id])
  end

  def edit
    @todo=Todo.find(params[:id])
  end
  def update
    @todo=Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice]="le travail a ete bien fait mon amie tu croyais quoi meme depuis le debut"
      redirect_to todos_path(@todo)
    else
      render "edit"
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name,:description)
  end
end
