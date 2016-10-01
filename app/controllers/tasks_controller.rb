class TasksController < ApplicationController

    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task[:action] = action=(@task[:action])
        if @task.save  # successful
            redirect_to tasks_path
        else  # unsuccessful, return to form
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def destroy
        Task.find(params[:id]).destroy
    end

    private

    def task_params
        params.require(:task).permit(:action, :description, :completed_at)
    end


end
