private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PayerResponsibilityType
    VpcEndpointAccount
    VpcEndpointServiceAccount

    def self.to_json(e : PayerResponsibilityType, json : JSON::Builder) : Nil
      value = case e
              when AEC::PayerResponsibilityType::VpcEndpointAccount        then "vpc-endpoint-account"
              when AEC::PayerResponsibilityType::VpcEndpointServiceAccount then "vpc-endpoint-service-account"
              else
                raise Exception.new("unknown enum value for 'PayerResponsibilityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PayerResponsibilityType
      value = pull.read_string
      case value
      when "vpc-endpoint-account"         then AEC::PayerResponsibilityType::VpcEndpointAccount
      when "vpc-endpoint-service-account" then AEC::PayerResponsibilityType::VpcEndpointServiceAccount
      else
        raise Exception.new("unknown enum value for 'PayerResponsibilityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PayerResponsibilityType::VpcEndpointAccount        then "vpc-endpoint-account"
      when AEC::PayerResponsibilityType::VpcEndpointServiceAccount then "vpc-endpoint-service-account"
      else
        raise Exception.new("unknown enum value for 'PayerResponsibilityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PayerResponsibilityType?
      case key
      when "vpc-endpoint-account"         then AEC::PayerResponsibilityType::VpcEndpointAccount
      when "vpc-endpoint-service-account" then AEC::PayerResponsibilityType::VpcEndpointServiceAccount
      else
        nil
      end
    end
  end
end
