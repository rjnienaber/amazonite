private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayMeteringPayerType
    SourceAttachmentOwner
    DestinationAttachmentOwner
    TransitGatewayOwner

    def self.to_json(e : TransitGatewayMeteringPayerType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayMeteringPayerType::SourceAttachmentOwner      then "source-attachment-owner"
              when AEC::TransitGatewayMeteringPayerType::DestinationAttachmentOwner then "destination-attachment-owner"
              when AEC::TransitGatewayMeteringPayerType::TransitGatewayOwner        then "transit-gateway-owner"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayMeteringPayerType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayMeteringPayerType
      value = pull.read_string
      case value
      when "source-attachment-owner"      then AEC::TransitGatewayMeteringPayerType::SourceAttachmentOwner
      when "destination-attachment-owner" then AEC::TransitGatewayMeteringPayerType::DestinationAttachmentOwner
      when "transit-gateway-owner"        then AEC::TransitGatewayMeteringPayerType::TransitGatewayOwner
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPayerType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayMeteringPayerType::SourceAttachmentOwner      then "source-attachment-owner"
      when AEC::TransitGatewayMeteringPayerType::DestinationAttachmentOwner then "destination-attachment-owner"
      when AEC::TransitGatewayMeteringPayerType::TransitGatewayOwner        then "transit-gateway-owner"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMeteringPayerType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayMeteringPayerType?
      case key
      when "source-attachment-owner"      then AEC::TransitGatewayMeteringPayerType::SourceAttachmentOwner
      when "destination-attachment-owner" then AEC::TransitGatewayMeteringPayerType::DestinationAttachmentOwner
      when "transit-gateway-owner"        then AEC::TransitGatewayMeteringPayerType::TransitGatewayOwner
      else
        nil
      end
    end
  end
end
