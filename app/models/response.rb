class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :participates, dependent: :destroy
  accepts_nested_attributes_for :participates, reject_if: :all_blank, allow_destroy: true
  
  
  
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
      subject: "Response",
      subject_id: self.id,
      act_name: 'responsed',
      user: adder
    )
  end

  
  
  
end
