module TasksHelper
    def format_complete(task)
        if task.is_complete?
            return "Yes!"
        else
            return "Not yet..."
        end
    end
end
