class TasksController < ApplicationController
    before_action :find_valid_task, except: [:index, :new, :create]

    def index
        @tasks = @current_user.tasks
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task[:action] = @task[:action].upcase
        @task.user_id = session[:user_id]
        if @task.save  # successful
            redirect_to task_path(@task)
        else  # unsuccessful, return to form
            render :new
        end
    end

    def show; end

    def edit; end

    def update
        @task.assign_attributes(task_params)
        @task[:action] = @task[:action].upcase
        if @task.save
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def complete
        @task.mark_complete
        if @task.save
            redirect_to task_path
        else
            render :index
        end
    end

    def destroy
        @task.destroy
        redirect_to tasks_path
    end

    private
    def find_valid_task
        begin
            @task = @current_user.tasks.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render file: "public/404", status: :not_found
        end
    end

    def task_params
        params.require(:task).permit(:action, :description, :completed_at)
    end
end
