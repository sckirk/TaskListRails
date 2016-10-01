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

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task[:action] = action=(@task[:action])
        if @task.update(task_params)
            redirect_to tasks_path
        else
            render :edit
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
