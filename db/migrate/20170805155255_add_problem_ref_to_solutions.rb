class AddProblemRefToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_reference :solutions, :problem, foreign_key: true
  end
end
