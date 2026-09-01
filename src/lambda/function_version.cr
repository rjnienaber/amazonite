private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum FunctionVersion
    All

    def self.to_json(e : FunctionVersion, json : JSON::Builder) : Nil
      value = case e
              when AL::FunctionVersion::All then "ALL"
              else
                raise Exception.new("unknown enum value for 'FunctionVersion' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::FunctionVersion
      value = pull.read_string
      case value
      when "ALL" then AL::FunctionVersion::All
      else
        raise Exception.new("unknown enum value for 'FunctionVersion' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::FunctionVersion::All then "ALL"
      else
        raise Exception.new("unknown enum value for 'FunctionVersion' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::FunctionVersion?
      case key
      when "ALL" then AL::FunctionVersion::All
      else
        nil
      end
    end
  end
end
