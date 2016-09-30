class Task < ActiveRecord::Base
    def is_complete?
        return completed_at != nil
    end
end
