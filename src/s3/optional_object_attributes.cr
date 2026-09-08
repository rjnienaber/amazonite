private alias AS = Amazonite::S3

module Amazonite::S3
  enum OptionalObjectAttributes
    RestoreStatus

    def self.to_json(e : OptionalObjectAttributes, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OptionalObjectAttributes
      value = pull.read_string
      case value
      when "RestoreStatus" then AS::OptionalObjectAttributes::RestoreStatus
      else
        raise Exception.new("unknown enum value for 'OptionalObjectAttributes' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::OptionalObjectAttributes?
      case key
      when "RestoreStatus" then AS::OptionalObjectAttributes::RestoreStatus
      else
        nil
      end
    end
  end
end
