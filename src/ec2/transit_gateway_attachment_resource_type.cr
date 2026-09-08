private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAttachmentResourceType
    Vpc
    Vpn
    VpnConcentrator
    DirectConnectGateway
    Connect
    Peering
    TgwPeering
    NetworkFunction
    ClientVpn

    def self.to_json(e : TransitGatewayAttachmentResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAttachmentResourceType::Vpc                  then "vpc"
              when AEC::TransitGatewayAttachmentResourceType::Vpn                  then "vpn"
              when AEC::TransitGatewayAttachmentResourceType::VpnConcentrator      then "vpn-concentrator"
              when AEC::TransitGatewayAttachmentResourceType::DirectConnectGateway then "direct-connect-gateway"
              when AEC::TransitGatewayAttachmentResourceType::Connect              then "connect"
              when AEC::TransitGatewayAttachmentResourceType::Peering              then "peering"
              when AEC::TransitGatewayAttachmentResourceType::TgwPeering           then "tgw-peering"
              when AEC::TransitGatewayAttachmentResourceType::NetworkFunction      then "network-function"
              when AEC::TransitGatewayAttachmentResourceType::ClientVpn            then "client-vpn"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAttachmentResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAttachmentResourceType
      value = pull.read_string
      case value
      when "vpc"                    then AEC::TransitGatewayAttachmentResourceType::Vpc
      when "vpn"                    then AEC::TransitGatewayAttachmentResourceType::Vpn
      when "vpn-concentrator"       then AEC::TransitGatewayAttachmentResourceType::VpnConcentrator
      when "direct-connect-gateway" then AEC::TransitGatewayAttachmentResourceType::DirectConnectGateway
      when "connect"                then AEC::TransitGatewayAttachmentResourceType::Connect
      when "peering"                then AEC::TransitGatewayAttachmentResourceType::Peering
      when "tgw-peering"            then AEC::TransitGatewayAttachmentResourceType::TgwPeering
      when "network-function"       then AEC::TransitGatewayAttachmentResourceType::NetworkFunction
      when "client-vpn"             then AEC::TransitGatewayAttachmentResourceType::ClientVpn
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAttachmentResourceType::Vpc                  then "vpc"
      when AEC::TransitGatewayAttachmentResourceType::Vpn                  then "vpn"
      when AEC::TransitGatewayAttachmentResourceType::VpnConcentrator      then "vpn-concentrator"
      when AEC::TransitGatewayAttachmentResourceType::DirectConnectGateway then "direct-connect-gateway"
      when AEC::TransitGatewayAttachmentResourceType::Connect              then "connect"
      when AEC::TransitGatewayAttachmentResourceType::Peering              then "peering"
      when AEC::TransitGatewayAttachmentResourceType::TgwPeering           then "tgw-peering"
      when AEC::TransitGatewayAttachmentResourceType::NetworkFunction      then "network-function"
      when AEC::TransitGatewayAttachmentResourceType::ClientVpn            then "client-vpn"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAttachmentResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAttachmentResourceType?
      case key
      when "vpc"                    then AEC::TransitGatewayAttachmentResourceType::Vpc
      when "vpn"                    then AEC::TransitGatewayAttachmentResourceType::Vpn
      when "vpn-concentrator"       then AEC::TransitGatewayAttachmentResourceType::VpnConcentrator
      when "direct-connect-gateway" then AEC::TransitGatewayAttachmentResourceType::DirectConnectGateway
      when "connect"                then AEC::TransitGatewayAttachmentResourceType::Connect
      when "peering"                then AEC::TransitGatewayAttachmentResourceType::Peering
      when "tgw-peering"            then AEC::TransitGatewayAttachmentResourceType::TgwPeering
      when "network-function"       then AEC::TransitGatewayAttachmentResourceType::NetworkFunction
      when "client-vpn"             then AEC::TransitGatewayAttachmentResourceType::ClientVpn
      else
        nil
      end
    end
  end
end
