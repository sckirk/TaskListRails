class TasksController < ApplicationController
    def index
        if session[:user_id].nil?
            redirect_to login_failure_path
        else
            @user = User.find(session[:user_id]) # < recalls the value set in a previous request
        end

        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task[:action] = @task[:action].upcase
        if @task.save  # successful
            redirect_to tasks_path
        else  # unsuccessful, return to form
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task[:action] = @task[:action].upcase
        if @task.update(task_params)
            redirect_to tasks_path
        else
            render :edit
        end
    end

    def complete
        @task = Task.find(params[:id])
        @task.mark_complete
        if @task.save
            redirect_to task_path
        else
            render :index
        end
    end

    def destroy
        Task.find(params[:id]).destroy
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:action, :description, :completed_at)
    end


end
