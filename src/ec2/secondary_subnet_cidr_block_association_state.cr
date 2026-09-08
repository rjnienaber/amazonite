private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondarySubnetCidrBlockAssociationState
    Associating
    Associated
    AssociationFailed
    Disassociating
    Disassociated
    DisassociationFailed

    def self.to_json(e : SecondarySubnetCidrBlockAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondarySubnetCidrBlockAssociationState::Associating          then "associating"
              when AEC::SecondarySubnetCidrBlockAssociationState::Associated           then "associated"
              when AEC::SecondarySubnetCidrBlockAssociationState::AssociationFailed    then "association-failed"
              when AEC::SecondarySubnetCidrBlockAssociationState::Disassociating       then "disassociating"
              when AEC::SecondarySubnetCidrBlockAssociationState::Disassociated        then "disassociated"
              when AEC::SecondarySubnetCidrBlockAssociationState::DisassociationFailed then "disassociation-failed"
              else
                raise Exception.new("unknown enum value for 'SecondarySubnetCidrBlockAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondarySubnetCidrBlockAssociationState
      value = pull.read_string
      case value
      when "associating"           then AEC::SecondarySubnetCidrBlockAssociationState::Associating
      when "associated"            then AEC::SecondarySubnetCidrBlockAssociationState::Associated
      when "association-failed"    then AEC::SecondarySubnetCidrBlockAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecondarySubnetCidrBlockAssociationState::Disassociating
      when "disassociated"         then AEC::SecondarySubnetCidrBlockAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecondarySubnetCidrBlockAssociationState::DisassociationFailed
      else
        raise Exception.new("unknown enum value for 'SecondarySubnetCidrBlockAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondarySubnetCidrBlockAssociationState::Associating          then "associating"
      when AEC::SecondarySubnetCidrBlockAssociationState::Associated           then "associated"
      when AEC::SecondarySubnetCidrBlockAssociationState::AssociationFailed    then "association-failed"
      when AEC::SecondarySubnetCidrBlockAssociationState::Disassociating       then "disassociating"
      when AEC::SecondarySubnetCidrBlockAssociationState::Disassociated        then "disassociated"
      when AEC::SecondarySubnetCidrBlockAssociationState::DisassociationFailed then "disassociation-failed"
      else
        raise Exception.new("unknown enum value for 'SecondarySubnetCidrBlockAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondarySubnetCidrBlockAssociationState?
      case key
      when "associating"           then AEC::SecondarySubnetCidrBlockAssociationState::Associating
      when "associated"            then AEC::SecondarySubnetCidrBlockAssociationState::Associated
      when "association-failed"    then AEC::SecondarySubnetCidrBlockAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecondarySubnetCidrBlockAssociationState::Disassociating
      when "disassociated"         then AEC::SecondarySubnetCidrBlockAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecondarySubnetCidrBlockAssociationState::DisassociationFailed
      else
        nil
      end
    end
  end
end
