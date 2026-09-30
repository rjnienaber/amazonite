private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondaryNetworkCidrBlockAssociationState
    Associating
    Associated
    AssociationFailed
    Disassociating
    Disassociated
    DisassociationFailed

    def self.to_json(e : SecondaryNetworkCidrBlockAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondaryNetworkCidrBlockAssociationState::Associating          then "associating"
              when AEC::SecondaryNetworkCidrBlockAssociationState::Associated           then "associated"
              when AEC::SecondaryNetworkCidrBlockAssociationState::AssociationFailed    then "association-failed"
              when AEC::SecondaryNetworkCidrBlockAssociationState::Disassociating       then "disassociating"
              when AEC::SecondaryNetworkCidrBlockAssociationState::Disassociated        then "disassociated"
              when AEC::SecondaryNetworkCidrBlockAssociationState::DisassociationFailed then "disassociation-failed"
              else
                raise Exception.new("unknown enum value for 'SecondaryNetworkCidrBlockAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondaryNetworkCidrBlockAssociationState
      value = pull.read_string
      case value
      when "associating"           then AEC::SecondaryNetworkCidrBlockAssociationState::Associating
      when "associated"            then AEC::SecondaryNetworkCidrBlockAssociationState::Associated
      when "association-failed"    then AEC::SecondaryNetworkCidrBlockAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecondaryNetworkCidrBlockAssociationState::Disassociating
      when "disassociated"         then AEC::SecondaryNetworkCidrBlockAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecondaryNetworkCidrBlockAssociationState::DisassociationFailed
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkCidrBlockAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondaryNetworkCidrBlockAssociationState::Associating          then "associating"
      when AEC::SecondaryNetworkCidrBlockAssociationState::Associated           then "associated"
      when AEC::SecondaryNetworkCidrBlockAssociationState::AssociationFailed    then "association-failed"
      when AEC::SecondaryNetworkCidrBlockAssociationState::Disassociating       then "disassociating"
      when AEC::SecondaryNetworkCidrBlockAssociationState::Disassociated        then "disassociated"
      when AEC::SecondaryNetworkCidrBlockAssociationState::DisassociationFailed then "disassociation-failed"
      else
        raise Exception.new("unknown enum value for 'SecondaryNetworkCidrBlockAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondaryNetworkCidrBlockAssociationState?
      case key
      when "associating"           then AEC::SecondaryNetworkCidrBlockAssociationState::Associating
      when "associated"            then AEC::SecondaryNetworkCidrBlockAssociationState::Associated
      when "association-failed"    then AEC::SecondaryNetworkCidrBlockAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecondaryNetworkCidrBlockAssociationState::Disassociating
      when "disassociated"         then AEC::SecondaryNetworkCidrBlockAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecondaryNetworkCidrBlockAssociationState::DisassociationFailed
      else
        nil
      end
    end
  end
end
