private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  # The format of an additional claim value. The only valid value is `SINGLE_STRING`.
  enum JwtClaimFormat
    SingleString

    def self.to_json(e : JwtClaimFormat, json : JSON::Builder) : Nil
      value = case e
              when AAG::JwtClaimFormat::SingleString then "SINGLE_STRING"
              else
                raise Exception.new("unknown enum value for 'JwtClaimFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::JwtClaimFormat
      value = pull.read_string
      case value
      when "SINGLE_STRING" then AAG::JwtClaimFormat::SingleString
      else
        raise Exception.new("unknown enum value for 'JwtClaimFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::JwtClaimFormat::SingleString then "SINGLE_STRING"
      else
        raise Exception.new("unknown enum value for 'JwtClaimFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::JwtClaimFormat?
      case key
      when "SINGLE_STRING" then AAG::JwtClaimFormat::SingleString
      else
        nil
      end
    end
  end
end
