private alias AS = Amazonite::S3

module Amazonite::S3
  enum RestoreRequestType
    Select

    def self.to_json(e : RestoreRequestType, json : JSON::Builder) : Nil
      value = case e
              when AS::RestoreRequestType::Select then "SELECT"
              else
                raise Exception.new("unknown enum value for 'RestoreRequestType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::RestoreRequestType
      value = pull.read_string
      case value
      when "SELECT" then AS::RestoreRequestType::Select
      else
        raise Exception.new("unknown enum value for 'RestoreRequestType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::RestoreRequestType::Select then "SELECT"
      else
        raise Exception.new("unknown enum value for 'RestoreRequestType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::RestoreRequestType?
      case key
      when "SELECT" then AS::RestoreRequestType::Select
      else
        nil
      end
    end
  end
end
