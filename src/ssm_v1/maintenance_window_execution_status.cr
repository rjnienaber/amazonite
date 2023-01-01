private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum MaintenanceWindowExecutionStatus
    Pending
    InProgress
    Success
    Failed
    TimedOut
    Cancelling
    Cancelled
    SkippedOverlapping

    def self.to_json(e : MaintenanceWindowExecutionStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::MaintenanceWindowExecutionStatus::Pending            then "PENDING"
              when AS::MaintenanceWindowExecutionStatus::InProgress         then "IN_PROGRESS"
              when AS::MaintenanceWindowExecutionStatus::Success            then "SUCCESS"
              when AS::MaintenanceWindowExecutionStatus::Failed             then "FAILED"
              when AS::MaintenanceWindowExecutionStatus::TimedOut           then "TIMED_OUT"
              when AS::MaintenanceWindowExecutionStatus::Cancelling         then "CANCELLING"
              when AS::MaintenanceWindowExecutionStatus::Cancelled          then "CANCELLED"
              when AS::MaintenanceWindowExecutionStatus::SkippedOverlapping then "SKIPPED_OVERLAPPING"
              else
                raise Exception.new("unknown enum value for 'MaintenanceWindowExecutionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MaintenanceWindowExecutionStatus
      value = pull.read_string
      case value
      when "PENDING"             then AS::MaintenanceWindowExecutionStatus::Pending
      when "IN_PROGRESS"         then AS::MaintenanceWindowExecutionStatus::InProgress
      when "SUCCESS"             then AS::MaintenanceWindowExecutionStatus::Success
      when "FAILED"              then AS::MaintenanceWindowExecutionStatus::Failed
      when "TIMED_OUT"           then AS::MaintenanceWindowExecutionStatus::TimedOut
      when "CANCELLING"          then AS::MaintenanceWindowExecutionStatus::Cancelling
      when "CANCELLED"           then AS::MaintenanceWindowExecutionStatus::Cancelled
      when "SKIPPED_OVERLAPPING" then AS::MaintenanceWindowExecutionStatus::SkippedOverlapping
      else
        raise Exception.new("unknown enum value for 'MaintenanceWindowExecutionStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
