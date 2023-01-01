private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CommandPluginStatus
    Pending
    InProgress
    Success
    TimedOut
    Cancelled
    Failed

    def self.to_json(e : CommandPluginStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CommandPluginStatus
      value = pull.read_string
      case value
      when "Pending"    then AS::CommandPluginStatus::Pending
      when "InProgress" then AS::CommandPluginStatus::InProgress
      when "Success"    then AS::CommandPluginStatus::Success
      when "TimedOut"   then AS::CommandPluginStatus::TimedOut
      when "Cancelled"  then AS::CommandPluginStatus::Cancelled
      when "Failed"     then AS::CommandPluginStatus::Failed
      else
        raise Exception.new("unknown enum value for 'CommandPluginStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
