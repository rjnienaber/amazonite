private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PermissionType
    VpcEndpoint
    TransitGatewayAttachment

    def self.to_json(e : PermissionType, json : JSON::Builder) : Nil
      value = case e
              when AEC::PermissionType::VpcEndpoint              then "vpc-endpoint"
              when AEC::PermissionType::TransitGatewayAttachment then "transit-gateway-attachment"
              else
                raise Exception.new("unknown enum value for 'PermissionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PermissionType
      value = pull.read_string
      case value
      when "vpc-endpoint"               then AEC::PermissionType::VpcEndpoint
      when "transit-gateway-attachment" then AEC::PermissionType::TransitGatewayAttachment
      else
        raise Exception.new("unknown enum value for 'PermissionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::PermissionType::VpcEndpoint              then "vpc-endpoint"
      when AEC::PermissionType::TransitGatewayAttachment then "transit-gateway-attachment"
      else
        raise Exception.new("unknown enum value for 'PermissionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::PermissionType?
      case key
      when "vpc-endpoint"               then AEC::PermissionType::VpcEndpoint
      when "transit-gateway-attachment" then AEC::PermissionType::TransitGatewayAttachment
      else
        nil
      end
    end
  end
end
