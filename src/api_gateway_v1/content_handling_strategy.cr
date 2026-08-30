private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum ContentHandlingStrategy
    ConvertToBinary
    ConvertToText

    def self.to_json(e : ContentHandlingStrategy, json : JSON::Builder) : Nil
      value = case e
              when AAG::ContentHandlingStrategy::ConvertToBinary then "CONVERT_TO_BINARY"
              when AAG::ContentHandlingStrategy::ConvertToText   then "CONVERT_TO_TEXT"
              else
                raise Exception.new("unknown enum value for 'ContentHandlingStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ContentHandlingStrategy
      value = pull.read_string
      case value
      when "CONVERT_TO_BINARY" then AAG::ContentHandlingStrategy::ConvertToBinary
      when "CONVERT_TO_TEXT"   then AAG::ContentHandlingStrategy::ConvertToText
      else
        raise Exception.new("unknown enum value for 'ContentHandlingStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ContentHandlingStrategy::ConvertToBinary then "CONVERT_TO_BINARY"
      when AAG::ContentHandlingStrategy::ConvertToText   then "CONVERT_TO_TEXT"
      else
        raise Exception.new("unknown enum value for 'ContentHandlingStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ContentHandlingStrategy?
      case key
      when "CONVERT_TO_BINARY" then AAG::ContentHandlingStrategy::ConvertToBinary
      when "CONVERT_TO_TEXT"   then AAG::ContentHandlingStrategy::ConvertToText
      else
        nil
      end
    end
  end
end
