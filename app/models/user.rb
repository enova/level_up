class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  rolify

  has_many :completions
  has_many :skills, through: :completions

  validates_presence_of :name
  validates_uniqueness_of :email

  def courses
    Course.for_student(self)
  end

  def has_completed?(skill)
    skills.include? skill
  end

  def admin?
    has_role?(:admin)
  end

  def signed_in?
    true
  end

end
