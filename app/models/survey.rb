class Survey < ApplicationRecord
    belongs_to :user
    has_many :polls, dependent: :destroy
    has_many :responses, dependent: :destroy
    
    accepts_nested_attributes_for :polls, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
    
    validates :title, presence: true
    validates :description, presence: true
    
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
      subject: "Survey",
      subject_id: self.id,
      act_name: 'survey_created',
      user: adder
    )
  end

 
end
    

