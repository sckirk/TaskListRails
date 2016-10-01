class Task < ActiveRecord::Base
    def is_complete?
        return completed_at != nil
    end

    def action=(val)
        self[:action] = val.upcase
    end

end
