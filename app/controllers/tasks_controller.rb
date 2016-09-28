class TasksController < ApplicationController

    def index
        @tasks = [
            {id: "1", name: "Task1", description: "Description1", completion_status: "Status1", completion_date: "Date1"},
            {id: "2", name: "Task2", description: "Description2", completion_status: "Status2", completion_date: "Date2"},
            {id: "3", name: "Task3", description: "Description3", completion_status: "Status3", completion_date: "Date3"},
            {id: "4", name: "Task4", description: "Description4", completion_status: "Status4", completion_date: "Date4"}
        ]
    end

    def show
        @tasks = [
            {id: "1", name: "Task1", description: "Description1", completion_status: "Status1", completion_date: "Date1"},
            {id: "2", name: "Task2", description: "Description2", completion_status: "Status2", completion_date: "Date2"},
            {id: "3", name: "Task3", description: "Description3", completion_status: "Status3", completion_date: "Date3"},
            {id: "4", name: "Task4", description: "Description4", completion_status: "Status4", completion_date: "Date4"}
        ]

        @tasks.each do |t|
            if params[:id] == t[:id]
                @task = t
            end
        end
    end
end
