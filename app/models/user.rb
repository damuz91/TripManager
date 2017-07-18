class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  include Statusable

  Roles = {admin: 1} # Todo: Describe roles here

  def role_name
    # TODO: I18n here
    return "Admin" if self.role == Roles[:admin]
    return "NA"
  end
  
end
