private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum ApiKeySourceType
    Header
    Authorizer

    def self.to_json(e : ApiKeySourceType, json : JSON::Builder) : Nil
      value = case e
              when AAG::ApiKeySourceType::Header     then "HEADER"
              when AAG::ApiKeySourceType::Authorizer then "AUTHORIZER"
              else
                raise Exception.new("unknown enum value for 'ApiKeySourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ApiKeySourceType
      value = pull.read_string
      case value
      when "HEADER"     then AAG::ApiKeySourceType::Header
      when "AUTHORIZER" then AAG::ApiKeySourceType::Authorizer
      else
        raise Exception.new("unknown enum value for 'ApiKeySourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ApiKeySourceType::Header     then "HEADER"
      when AAG::ApiKeySourceType::Authorizer then "AUTHORIZER"
      else
        raise Exception.new("unknown enum value for 'ApiKeySourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ApiKeySourceType?
      case key
      when "HEADER"     then AAG::ApiKeySourceType::Header
      when "AUTHORIZER" then AAG::ApiKeySourceType::Authorizer
      else
        nil
      end
    end
  end
end
