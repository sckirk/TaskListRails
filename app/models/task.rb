class Task < ActiveRecord::Base
    def is_complete?
        return completed_at != nil
    end

    def action=(val)
        self[:action] = val.upcase
    end

    def mark_complete
        self[:completed_at] = Time.now.utc
    end
end
