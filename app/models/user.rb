class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable 
  has_many :wikis
  enum role: [:standard, :premium, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  def admin?
    role == 'admin'
  end

end
