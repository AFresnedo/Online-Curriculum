class RemoveUserRefToAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :answers, :user, foreign_key: true
  end
end
