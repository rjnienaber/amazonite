private alias AS = Amazonite::S3

module Amazonite::S3
  enum ReplicationTimeStatus
    Enabled
    Disabled

    def self.to_json(e : ReplicationTimeStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ReplicationTimeStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::ReplicationTimeStatus::Enabled
      when "Disabled" then AS::ReplicationTimeStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'ReplicationTimeStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ReplicationTimeStatus?
      case key
      when "Enabled"  then AS::ReplicationTimeStatus::Enabled
      when "Disabled" then AS::ReplicationTimeStatus::Disabled
      else
        nil
      end
    end
  end
end
