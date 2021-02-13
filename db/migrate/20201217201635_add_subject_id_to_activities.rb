class AddSubjectIdToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :subject_id, :integer
  end
end
