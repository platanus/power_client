class CreateClientJob < ActiveRecord::Migration[5.2]
  def change
    create_table :client_jobs do |t|
      t.text :screenshot_file_data
      t.references :active_job_log_job, foreign_key: true

      t.timestamps
    end
  end
end
