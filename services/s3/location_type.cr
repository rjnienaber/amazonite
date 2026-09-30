private alias AS = Amazonite::S3

module Amazonite::S3
  enum LocationType
    AvailabilityZone
    LocalZone

    def self.to_json(e : LocationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::LocationType
      value = pull.read_string
      case value
      when "AvailabilityZone" then AS::LocationType::AvailabilityZone
      when "LocalZone"        then AS::LocationType::LocalZone
      else
        raise Exception.new("unknown enum value for 'LocationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::LocationType?
      case key
      when "AvailabilityZone" then AS::LocationType::AvailabilityZone
      when "LocalZone"        then AS::LocationType::LocalZone
      else
        nil
      end
    end
  end
end
