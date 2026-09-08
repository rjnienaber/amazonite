private alias AS = Amazonite::S3

module Amazonite::S3
  enum ReplicationRuleStatus
    Enabled
    Disabled

    def self.to_json(e : ReplicationRuleStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ReplicationRuleStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::ReplicationRuleStatus::Enabled
      when "Disabled" then AS::ReplicationRuleStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'ReplicationRuleStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ReplicationRuleStatus?
      case key
      when "Enabled"  then AS::ReplicationRuleStatus::Enabled
      when "Disabled" then AS::ReplicationRuleStatus::Disabled
      else
        nil
      end
    end
  end
end
