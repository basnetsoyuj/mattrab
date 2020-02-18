class Question < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :answers, dependent: :destroy

  after_create :create_notifications

  def create_notifications
    Notification.create(recipient: self.note.user, actor: self.user, action: 'questioned', notifiable: self.note)
  end
end
