private alias AS = Amazonite::Ssm

module Amazonite::Ssm
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

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::CommandPluginStatus?
      case key
      when "Pending"    then AS::CommandPluginStatus::Pending
      when "InProgress" then AS::CommandPluginStatus::InProgress
      when "Success"    then AS::CommandPluginStatus::Success
      when "TimedOut"   then AS::CommandPluginStatus::TimedOut
      when "Cancelled"  then AS::CommandPluginStatus::Cancelled
      when "Failed"     then AS::CommandPluginStatus::Failed
      else
        nil
      end
    end
  end
end
