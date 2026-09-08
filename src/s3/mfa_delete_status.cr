private alias AS = Amazonite::S3

module Amazonite::S3
  enum MFADeleteStatus
    Enabled
    Disabled

    def self.to_json(e : MFADeleteStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MFADeleteStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::MFADeleteStatus::Enabled
      when "Disabled" then AS::MFADeleteStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'MFADeleteStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::MFADeleteStatus?
      case key
      when "Enabled"  then AS::MFADeleteStatus::Enabled
      when "Disabled" then AS::MFADeleteStatus::Disabled
      else
        nil
      end
    end
  end
end
