private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransitGatewayMulitcastDomainAssociationState
    PendingAcceptance
    Associating
    Associated
    Disassociating
    Disassociated
    Rejected
    Failed

    def self.to_json(e : TransitGatewayMulitcastDomainAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransitGatewayMulitcastDomainAssociationState::PendingAcceptance then "pendingAcceptance"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Associating       then "associating"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Associated        then "associated"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Disassociating    then "disassociating"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Disassociated     then "disassociated"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Rejected          then "rejected"
              when AEC::TransitGatewayMulitcastDomainAssociationState::Failed            then "failed"
              else
                raise Exception.new("unknown enum value for 'TransitGatewayMulitcastDomainAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransitGatewayMulitcastDomainAssociationState
      value = pull.read_string
      case value
      when "pendingAcceptance" then AEC::TransitGatewayMulitcastDomainAssociationState::PendingAcceptance
      when "associating"       then AEC::TransitGatewayMulitcastDomainAssociationState::Associating
      when "associated"        then AEC::TransitGatewayMulitcastDomainAssociationState::Associated
      when "disassociating"    then AEC::TransitGatewayMulitcastDomainAssociationState::Disassociating
      when "disassociated"     then AEC::TransitGatewayMulitcastDomainAssociationState::Disassociated
      when "rejected"          then AEC::TransitGatewayMulitcastDomainAssociationState::Rejected
      when "failed"            then AEC::TransitGatewayMulitcastDomainAssociationState::Failed
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMulitcastDomainAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransitGatewayMulitcastDomainAssociationState::PendingAcceptance then "pendingAcceptance"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Associating       then "associating"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Associated        then "associated"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Disassociating    then "disassociating"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Disassociated     then "disassociated"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Rejected          then "rejected"
      when AEC::TransitGatewayMulitcastDomainAssociationState::Failed            then "failed"
      else
        raise Exception.new("unknown enum value for 'TransitGatewayMulitcastDomainAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransitGatewayMulitcastDomainAssociationState?
      case key
      when "pendingAcceptance" then AEC::TransitGatewayMulitcastDomainAssociationState::PendingAcceptance
      when "associating"       then AEC::TransitGatewayMulitcastDomainAssociationState::Associating
      when "associated"        then AEC::TransitGatewayMulitcastDomainAssociationState::Associated
      when "disassociating"    then AEC::TransitGatewayMulitcastDomainAssociationState::Disassociating
      when "disassociated"     then AEC::TransitGatewayMulitcastDomainAssociationState::Disassociated
      when "rejected"          then AEC::TransitGatewayMulitcastDomainAssociationState::Rejected
      when "failed"            then AEC::TransitGatewayMulitcastDomainAssociationState::Failed
      else
        nil
      end
    end
  end
end
