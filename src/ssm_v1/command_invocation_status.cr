private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CommandInvocationStatus
    Pending
    InProgress
    Delayed
    Success
    Cancelled
    TimedOut
    Failed
    Cancelling

    def self.to_json(e : CommandInvocationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CommandInvocationStatus
      value = pull.read_string
      case value
      when "Pending"    then AS::CommandInvocationStatus::Pending
      when "InProgress" then AS::CommandInvocationStatus::InProgress
      when "Delayed"    then AS::CommandInvocationStatus::Delayed
      when "Success"    then AS::CommandInvocationStatus::Success
      when "Cancelled"  then AS::CommandInvocationStatus::Cancelled
      when "TimedOut"   then AS::CommandInvocationStatus::TimedOut
      when "Failed"     then AS::CommandInvocationStatus::Failed
      when "Cancelling" then AS::CommandInvocationStatus::Cancelling
      else
        raise Exception.new("unknown enum value for 'CommandInvocationStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
