private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum OpsItemStatus
    Open
    InProgress
    Resolved
    Pending
    TimedOut
    Cancelling
    Cancelled
    Failed
    CompletedWithSuccess
    CompletedWithFailure
    Scheduled
    RunbookInProgress
    PendingChangeCalendarOverride
    ChangeCalendarOverrideApproved
    ChangeCalendarOverrideRejected
    PendingApproval
    Approved
    Revoked
    Rejected
    Closed

    def self.to_json(e : OpsItemStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemStatus
      value = pull.read_string
      case value
      when "Open"                           then AS::OpsItemStatus::Open
      when "InProgress"                     then AS::OpsItemStatus::InProgress
      when "Resolved"                       then AS::OpsItemStatus::Resolved
      when "Pending"                        then AS::OpsItemStatus::Pending
      when "TimedOut"                       then AS::OpsItemStatus::TimedOut
      when "Cancelling"                     then AS::OpsItemStatus::Cancelling
      when "Cancelled"                      then AS::OpsItemStatus::Cancelled
      when "Failed"                         then AS::OpsItemStatus::Failed
      when "CompletedWithSuccess"           then AS::OpsItemStatus::CompletedWithSuccess
      when "CompletedWithFailure"           then AS::OpsItemStatus::CompletedWithFailure
      when "Scheduled"                      then AS::OpsItemStatus::Scheduled
      when "RunbookInProgress"              then AS::OpsItemStatus::RunbookInProgress
      when "PendingChangeCalendarOverride"  then AS::OpsItemStatus::PendingChangeCalendarOverride
      when "ChangeCalendarOverrideApproved" then AS::OpsItemStatus::ChangeCalendarOverrideApproved
      when "ChangeCalendarOverrideRejected" then AS::OpsItemStatus::ChangeCalendarOverrideRejected
      when "PendingApproval"                then AS::OpsItemStatus::PendingApproval
      when "Approved"                       then AS::OpsItemStatus::Approved
      when "Revoked"                        then AS::OpsItemStatus::Revoked
      when "Rejected"                       then AS::OpsItemStatus::Rejected
      when "Closed"                         then AS::OpsItemStatus::Closed
      else
        raise Exception.new("unknown enum value for 'OpsItemStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::OpsItemStatus?
      case key
      when "Open"                           then AS::OpsItemStatus::Open
      when "InProgress"                     then AS::OpsItemStatus::InProgress
      when "Resolved"                       then AS::OpsItemStatus::Resolved
      when "Pending"                        then AS::OpsItemStatus::Pending
      when "TimedOut"                       then AS::OpsItemStatus::TimedOut
      when "Cancelling"                     then AS::OpsItemStatus::Cancelling
      when "Cancelled"                      then AS::OpsItemStatus::Cancelled
      when "Failed"                         then AS::OpsItemStatus::Failed
      when "CompletedWithSuccess"           then AS::OpsItemStatus::CompletedWithSuccess
      when "CompletedWithFailure"           then AS::OpsItemStatus::CompletedWithFailure
      when "Scheduled"                      then AS::OpsItemStatus::Scheduled
      when "RunbookInProgress"              then AS::OpsItemStatus::RunbookInProgress
      when "PendingChangeCalendarOverride"  then AS::OpsItemStatus::PendingChangeCalendarOverride
      when "ChangeCalendarOverrideApproved" then AS::OpsItemStatus::ChangeCalendarOverrideApproved
      when "ChangeCalendarOverrideRejected" then AS::OpsItemStatus::ChangeCalendarOverrideRejected
      when "PendingApproval"                then AS::OpsItemStatus::PendingApproval
      when "Approved"                       then AS::OpsItemStatus::Approved
      when "Revoked"                        then AS::OpsItemStatus::Revoked
      when "Rejected"                       then AS::OpsItemStatus::Rejected
      when "Closed"                         then AS::OpsItemStatus::Closed
      else
        nil
      end
    end
  end
end
