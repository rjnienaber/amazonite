private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CommandStatus
    Pending
    InProgress
    Success
    Cancelled
    Failed
    TimedOut
    Cancelling

    def self.to_json(e : CommandStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CommandStatus
      value = pull.read_string
      case value
      when "Pending"    then AS::CommandStatus::Pending
      when "InProgress" then AS::CommandStatus::InProgress
      when "Success"    then AS::CommandStatus::Success
      when "Cancelled"  then AS::CommandStatus::Cancelled
      when "Failed"     then AS::CommandStatus::Failed
      when "TimedOut"   then AS::CommandStatus::TimedOut
      when "Cancelling" then AS::CommandStatus::Cancelling
      else
        raise Exception.new("unknown enum value for 'CommandStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
