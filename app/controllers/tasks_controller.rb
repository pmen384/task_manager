class TasksController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを作成しました。"
      redirect_to request.referrer || root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @task = current_user.tasks.find_by(id: params[:id])
    return redirect_to root_url if @task.nil?
    @task.destroy
    flash[:success] = "tasklist deleted"
    redirect_to request.referrer || root_url
  end
  
  def toggle
    render nothing: true
    @task = current_user.tasks.find_by(id: params[:id])
    @task.do = !@task.do
    @task.save
  end
  
  private
    def task_params
      params.require(:task).permit(:title,:content,:tasktime)
    end
end