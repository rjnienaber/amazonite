private alias AS = Amazonite::S3

module Amazonite::S3
  enum DataRedundancy
    SingleAvailabilityZone
    SingleLocalZone

    def self.to_json(e : DataRedundancy, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DataRedundancy
      value = pull.read_string
      case value
      when "SingleAvailabilityZone" then AS::DataRedundancy::SingleAvailabilityZone
      when "SingleLocalZone"        then AS::DataRedundancy::SingleLocalZone
      else
        raise Exception.new("unknown enum value for 'DataRedundancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DataRedundancy?
      case key
      when "SingleAvailabilityZone" then AS::DataRedundancy::SingleAvailabilityZone
      when "SingleLocalZone"        then AS::DataRedundancy::SingleLocalZone
      else
        nil
      end
    end
  end
end
