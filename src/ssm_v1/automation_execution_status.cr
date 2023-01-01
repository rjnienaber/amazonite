private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AutomationExecutionStatus
    Pending
    InProgress
    Waiting
    Success
    TimedOut
    Cancelling
    Cancelled
    Failed
    PendingApproval
    Approved
    Rejected
    Scheduled
    RunbookInProgress
    PendingChangeCalendarOverride
    ChangeCalendarOverrideApproved
    ChangeCalendarOverrideRejected
    CompletedWithSuccess
    CompletedWithFailure

    def self.to_json(e : AutomationExecutionStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AutomationExecutionStatus
      value = pull.read_string
      case value
      when "Pending"                        then AS::AutomationExecutionStatus::Pending
      when "InProgress"                     then AS::AutomationExecutionStatus::InProgress
      when "Waiting"                        then AS::AutomationExecutionStatus::Waiting
      when "Success"                        then AS::AutomationExecutionStatus::Success
      when "TimedOut"                       then AS::AutomationExecutionStatus::TimedOut
      when "Cancelling"                     then AS::AutomationExecutionStatus::Cancelling
      when "Cancelled"                      then AS::AutomationExecutionStatus::Cancelled
      when "Failed"                         then AS::AutomationExecutionStatus::Failed
      when "PendingApproval"                then AS::AutomationExecutionStatus::PendingApproval
      when "Approved"                       then AS::AutomationExecutionStatus::Approved
      when "Rejected"                       then AS::AutomationExecutionStatus::Rejected
      when "Scheduled"                      then AS::AutomationExecutionStatus::Scheduled
      when "RunbookInProgress"              then AS::AutomationExecutionStatus::RunbookInProgress
      when "PendingChangeCalendarOverride"  then AS::AutomationExecutionStatus::PendingChangeCalendarOverride
      when "ChangeCalendarOverrideApproved" then AS::AutomationExecutionStatus::ChangeCalendarOverrideApproved
      when "ChangeCalendarOverrideRejected" then AS::AutomationExecutionStatus::ChangeCalendarOverrideRejected
      when "CompletedWithSuccess"           then AS::AutomationExecutionStatus::CompletedWithSuccess
      when "CompletedWithFailure"           then AS::AutomationExecutionStatus::CompletedWithFailure
      else
        raise Exception.new("unknown enum value for 'AutomationExecutionStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
