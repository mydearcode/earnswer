class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :body, presence: true
  
  
  after_create :create_activities

  def adder
    user
  end

 

  private

  def create_activities
    create_activity_for_adder
  end

  def create_activity_for_adder
    Activity.create(
      subject: "Answer",
      subject_id: self.id,
      act_name: 'Answered',
      user: adder
    )
  end
  
  
  
  
  
  
  
  
end
