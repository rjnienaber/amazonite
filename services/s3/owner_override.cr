private alias AS = Amazonite::S3

module Amazonite::S3
  enum OwnerOverride
    Destination

    def self.to_json(e : OwnerOverride, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OwnerOverride
      value = pull.read_string
      case value
      when "Destination" then AS::OwnerOverride::Destination
      else
        raise Exception.new("unknown enum value for 'OwnerOverride' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::OwnerOverride?
      case key
      when "Destination" then AS::OwnerOverride::Destination
      else
        nil
      end
    end
  end
end
