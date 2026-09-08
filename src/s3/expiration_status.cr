private alias AS = Amazonite::S3

module Amazonite::S3
  enum ExpirationStatus
    Enabled
    Disabled

    def self.to_json(e : ExpirationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExpirationStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::ExpirationStatus::Enabled
      when "Disabled" then AS::ExpirationStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'ExpirationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ExpirationStatus?
      case key
      when "Enabled"  then AS::ExpirationStatus::Enabled
      when "Disabled" then AS::ExpirationStatus::Disabled
      else
        nil
      end
    end
  end
end
