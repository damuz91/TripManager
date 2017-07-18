module Statusable
  extend ActiveSupport::Concern

  included do
    Status = {active: 1, inactive: 0, deleted: 2}
    validates :status, presence: true
  end

  def status_name
    # TODO: I18n here
    return "Active" if self.status == Status[:active]
    return "Inactive" if self.status == Status[:inactive]
    return "Deleted" if self.status == Status[:deleted]
    return "NA"
  end

  def activate
    self.update_attribute(:status, Status[:active])
  end

  def inactivate
    self.update_attribute(:status, Status[:inactive])
  end

  def delete
    self.update_attribute(:status, Status[:deleted])
  end

  module ClassMethods

    def get_status_for_select
      {
        "Active" => Status[:active],
        "Inactive" => Status[:inactive],
        "Deleted" => Status[:deleted]
      }
    end

  end

end