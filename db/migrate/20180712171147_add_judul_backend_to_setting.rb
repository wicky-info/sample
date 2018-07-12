class AddJudulBackendToSetting < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :judul_backend, :string
  end
end
