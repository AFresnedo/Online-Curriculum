class AddModuleToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :module, :string
  end
end
