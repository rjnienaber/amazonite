private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayMulticastDomainState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : TransitGatewayMulticastDomainState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayMulticastDomainState::Pending   then "pending"
              when AEC::TransitGatewayMulticastDomainState::Available then "available"
              when AEC::TransitGatewayMulticastDomainState::Deleting  then "deleting"
              when AEC::TransitGatewayMulticastDomainState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayMulticastDomainState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayMulticastDomainState
      value = pull.read_string
      case value
      when "pending"   then AEC::TransitGatewayMulticastDomainState::Pending
      when "available" then AEC::TransitGatewayMulticastDomainState::Available
      when "deleting"  then AEC::TransitGatewayMulticastDomainState::Deleting
      when "deleted"   then AEC::TransitGatewayMulticastDomainState::Deleted
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMulticastDomainState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayMulticastDomainState::Pending   then "pending"
      when AEC::TransitGatewayMulticastDomainState::Available then "available"
      when AEC::TransitGatewayMulticastDomainState::Deleting  then "deleting"
      when AEC::TransitGatewayMulticastDomainState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMulticastDomainState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayMulticastDomainState?
      case key
      when "pending"   then AEC::TransitGatewayMulticastDomainState::Pending
      when "available" then AEC::TransitGatewayMulticastDomainState::Available
      when "deleting"  then AEC::TransitGatewayMulticastDomainState::Deleting
      when "deleted"   then AEC::TransitGatewayMulticastDomainState::Deleted
      else
        nil
      end
    end
  end
end
