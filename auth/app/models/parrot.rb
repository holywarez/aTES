class Parrot < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :created_message, on: :create
  after_commit :updated_message, on: :update
  after_commit :deleted_message, on: :destroy

  private

  def created_message
    ApplicationMessage.deliver(Parrots::CreatedMessage.new(self))
  end

  def updated_message
    ApplicationMessage.deliver(Parrots::UpdatedMessage.new(self))
  end

  def deleted_message
    ApplicationMessage.deliver(Parrots::DeletedMessage.new(self))
  end
end
