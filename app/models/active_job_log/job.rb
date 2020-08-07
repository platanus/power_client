module ActiveJobLog
  class Job < ApplicationRecord
    include Loggeable

    has_one :client_job,
      foreign_key: 'active_job_log_job_id', required: false, dependent: :destroy,
      inverse_of: :active_job_log_job
  end
end

# == Schema Information
#
# Table name: active_job_log_jobs
#
#  id                 :bigint(8)        not null, primary key
#  job_id             :string
#  params             :text
#  status             :string
#  job_class          :string
#  error              :text
#  stack_trace        :text
#  queued_at          :datetime
#  started_at         :datetime
#  ended_at           :datetime
#  queued_duration    :integer
#  execution_duration :integer
#  total_duration     :integer
#  executions         :integer
#  queue_name         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_active_job_log_jobs_on_job_id  (job_id)
#
