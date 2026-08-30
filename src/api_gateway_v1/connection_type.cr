private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  enum ConnectionType
    Internet
    VpcLink

    def self.to_json(e : ConnectionType, json : JSON::Builder) : Nil
      value = case e
              when AAG::ConnectionType::Internet then "INTERNET"
              when AAG::ConnectionType::VpcLink  then "VPC_LINK"
              else
                raise Exception.new("unknown enum value for 'ConnectionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ConnectionType
      value = pull.read_string
      case value
      when "INTERNET" then AAG::ConnectionType::Internet
      when "VPC_LINK" then AAG::ConnectionType::VpcLink
      else
        raise Exception.new("unknown enum value for 'ConnectionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ConnectionType::Internet then "INTERNET"
      when AAG::ConnectionType::VpcLink  then "VPC_LINK"
      else
        raise Exception.new("unknown enum value for 'ConnectionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ConnectionType?
      case key
      when "INTERNET" then AAG::ConnectionType::Internet
      when "VPC_LINK" then AAG::ConnectionType::VpcLink
      else
        nil
      end
    end
  end
end
