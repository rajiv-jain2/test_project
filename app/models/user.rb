class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  include FriendlyId
  friendly_id :slug_candidates, use: [:slugged]

  def slug_candidates
    last_sequence_number_slug_suffix = self.last_sequence_number_slug_suffix
    slug_candidates = [:first_name,[:first_name, :last_name], [:first_name, :last_name, last_sequence_number_slug_suffix]]
    i = 1
    while i < last_sequence_number_slug_suffix  do
      slug_candidates << [:first_name, :last_name, i]
      i +=1
    end
    slug_candidates
  end

  def last_sequence_number_slug_suffix
    users = User.where(:first_name => self.first_name, :last_name => self.last_name)
    users.size + 1
  end

  def teacher?
    self.user_type && 1 == 1
  end

  def student?
    self.user_type && 2 == 2
  end

  def parents?
    self.user_type && 4 == 4
  end
end
