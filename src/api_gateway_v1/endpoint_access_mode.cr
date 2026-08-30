private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum EndpointAccessMode
    Basic
    Strict

    def self.to_json(e : EndpointAccessMode, json : JSON::Builder) : Nil
      value = case e
              when AAG::EndpointAccessMode::Basic  then "BASIC"
              when AAG::EndpointAccessMode::Strict then "STRICT"
              else
                raise Exception.new("unknown enum value for 'EndpointAccessMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::EndpointAccessMode
      value = pull.read_string
      case value
      when "BASIC"  then AAG::EndpointAccessMode::Basic
      when "STRICT" then AAG::EndpointAccessMode::Strict
      else
        raise Exception.new("unknown enum value for 'EndpointAccessMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::EndpointAccessMode::Basic  then "BASIC"
      when AAG::EndpointAccessMode::Strict then "STRICT"
      else
        raise Exception.new("unknown enum value for 'EndpointAccessMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::EndpointAccessMode?
      case key
      when "BASIC"  then AAG::EndpointAccessMode::Basic
      when "STRICT" then AAG::EndpointAccessMode::Strict
      else
        nil
      end
    end
  end
end
