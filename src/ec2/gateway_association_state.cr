private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum GatewayAssociationState
    Associated
    NotAssociated
    Associating
    Disassociating

    def self.to_json(e : GatewayAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::GatewayAssociationState::Associated     then "associated"
              when AEC::GatewayAssociationState::NotAssociated  then "not-associated"
              when AEC::GatewayAssociationState::Associating    then "associating"
              when AEC::GatewayAssociationState::Disassociating then "disassociating"
              else
                raise Exception.new("unknown enum value for 'GatewayAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::GatewayAssociationState
      value = pull.read_string
      case value
      when "associated"     then AEC::GatewayAssociationState::Associated
      when "not-associated" then AEC::GatewayAssociationState::NotAssociated
      when "associating"    then AEC::GatewayAssociationState::Associating
      when "disassociating" then AEC::GatewayAssociationState::Disassociating
      else
        raise Exception.new("unknown enum value for 'GatewayAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::GatewayAssociationState::Associated     then "associated"
      when AEC::GatewayAssociationState::NotAssociated  then "not-associated"
      when AEC::GatewayAssociationState::Associating    then "associating"
      when AEC::GatewayAssociationState::Disassociating then "disassociating"
      else
        raise Exception.new("unknown enum value for 'GatewayAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::GatewayAssociationState?
      case key
      when "associated"     then AEC::GatewayAssociationState::Associated
      when "not-associated" then AEC::GatewayAssociationState::NotAssociated
      when "associating"    then AEC::GatewayAssociationState::Associating
      when "disassociating" then AEC::GatewayAssociationState::Disassociating
      else
        nil
      end
    end
  end
end
