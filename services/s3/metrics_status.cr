private alias AS = Amazonite::S3

module Amazonite::S3
  enum MetricsStatus
    Enabled
    Disabled

    def self.to_json(e : MetricsStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MetricsStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::MetricsStatus::Enabled
      when "Disabled" then AS::MetricsStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'MetricsStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::MetricsStatus?
      case key
      when "Enabled"  then AS::MetricsStatus::Enabled
      when "Disabled" then AS::MetricsStatus::Disabled
      else
        nil
      end
    end
  end
end
