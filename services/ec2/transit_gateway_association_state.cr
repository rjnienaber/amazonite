private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayAssociationState
    Associating
    Associated
    Disassociating
    Disassociated

    def self.to_json(e : TransitGatewayAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayAssociationState::Associating    then "associating"
              when AEC::TransitGatewayAssociationState::Associated     then "associated"
              when AEC::TransitGatewayAssociationState::Disassociating then "disassociating"
              when AEC::TransitGatewayAssociationState::Disassociated  then "disassociated"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayAssociationState
      value = pull.read_string
      case value
      when "associating"    then AEC::TransitGatewayAssociationState::Associating
      when "associated"     then AEC::TransitGatewayAssociationState::Associated
      when "disassociating" then AEC::TransitGatewayAssociationState::Disassociating
      when "disassociated"  then AEC::TransitGatewayAssociationState::Disassociated
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayAssociationState::Associating    then "associating"
      when AEC::TransitGatewayAssociationState::Associated     then "associated"
      when AEC::TransitGatewayAssociationState::Disassociating then "disassociating"
      when AEC::TransitGatewayAssociationState::Disassociated  then "disassociated"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayAssociationState?
      case key
      when "associating"    then AEC::TransitGatewayAssociationState::Associating
      when "associated"     then AEC::TransitGatewayAssociationState::Associated
      when "disassociating" then AEC::TransitGatewayAssociationState::Disassociating
      when "disassociated"  then AEC::TransitGatewayAssociationState::Disassociated
      else
        nil
      end
    end
  end
end
