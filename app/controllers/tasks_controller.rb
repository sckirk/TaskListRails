class TasksController < ApplicationController
    before_action :set_user
    before_action :find_valid_task, :only [:show, :edit, :update]

    def index
        @tasks = Task.where(user_id: @current_user.id)
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

    def show; end

    def edit; end

    def update
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

    def set_user
        self.current_user
    end

    def find_valid_task
        if Task.find(params[:id]).user_id == @current_user.id
            @task = Task.find(params[:id])
        end
    end

    def task_params
        params.require(:task).permit(:action, :description, :completed_at)
    end


end
