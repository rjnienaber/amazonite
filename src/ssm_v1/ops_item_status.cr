private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
      when "Rejected"                       then AS::OpsItemStatus::Rejected
      when "Closed"                         then AS::OpsItemStatus::Closed
      else
        raise Exception.new("unknown enum value for 'OpsItemStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
