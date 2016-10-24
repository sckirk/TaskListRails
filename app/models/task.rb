class Task < ActiveRecord::Base
    belongs_to :user

    def is_complete?
        return completed_at != nil
    end

    def mark_complete
        self[:completed_at] = Time.now.utc
    end
end
