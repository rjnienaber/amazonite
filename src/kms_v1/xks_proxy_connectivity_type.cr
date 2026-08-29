private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum XksProxyConnectivityType
    PublicEndpoint
    VpcEndpointService

    def self.to_json(e : XksProxyConnectivityType, json : JSON::Builder) : Nil
      value = case e
              when AK::XksProxyConnectivityType::PublicEndpoint     then "PUBLIC_ENDPOINT"
              when AK::XksProxyConnectivityType::VpcEndpointService then "VPC_ENDPOINT_SERVICE"
              else
                raise Exception.new("unknown enum value for 'XksProxyConnectivityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::XksProxyConnectivityType
      value = pull.read_string
      case value
      when "PUBLIC_ENDPOINT"      then AK::XksProxyConnectivityType::PublicEndpoint
      when "VPC_ENDPOINT_SERVICE" then AK::XksProxyConnectivityType::VpcEndpointService
      else
        raise Exception.new("unknown enum value for 'XksProxyConnectivityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::XksProxyConnectivityType::PublicEndpoint     then "PUBLIC_ENDPOINT"
      when AK::XksProxyConnectivityType::VpcEndpointService then "VPC_ENDPOINT_SERVICE"
      else
        raise Exception.new("unknown enum value for 'XksProxyConnectivityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::XksProxyConnectivityType?
      case key
      when "PUBLIC_ENDPOINT"      then AK::XksProxyConnectivityType::PublicEndpoint
      when "VPC_ENDPOINT_SERVICE" then AK::XksProxyConnectivityType::VpcEndpointService
      else
        nil
      end
    end
  end
end
