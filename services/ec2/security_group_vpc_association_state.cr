private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecurityGroupVpcAssociationState
    Associating
    Associated
    AssociationFailed
    Disassociating
    Disassociated
    DisassociationFailed

    def self.to_json(e : SecurityGroupVpcAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecurityGroupVpcAssociationState::Associating          then "associating"
              when AEC::SecurityGroupVpcAssociationState::Associated           then "associated"
              when AEC::SecurityGroupVpcAssociationState::AssociationFailed    then "association-failed"
              when AEC::SecurityGroupVpcAssociationState::Disassociating       then "disassociating"
              when AEC::SecurityGroupVpcAssociationState::Disassociated        then "disassociated"
              when AEC::SecurityGroupVpcAssociationState::DisassociationFailed then "disassociation-failed"
              else
                raise Exception.new("unknown enum value for 'SecurityGroupVpcAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecurityGroupVpcAssociationState
      value = pull.read_string
      case value
      when "associating"           then AEC::SecurityGroupVpcAssociationState::Associating
      when "associated"            then AEC::SecurityGroupVpcAssociationState::Associated
      when "association-failed"    then AEC::SecurityGroupVpcAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecurityGroupVpcAssociationState::Disassociating
      when "disassociated"         then AEC::SecurityGroupVpcAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecurityGroupVpcAssociationState::DisassociationFailed
      else
        raise Exception.new("unknown enum value for 'SecurityGroupVpcAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecurityGroupVpcAssociationState::Associating          then "associating"
      when AEC::SecurityGroupVpcAssociationState::Associated           then "associated"
      when AEC::SecurityGroupVpcAssociationState::AssociationFailed    then "association-failed"
      when AEC::SecurityGroupVpcAssociationState::Disassociating       then "disassociating"
      when AEC::SecurityGroupVpcAssociationState::Disassociated        then "disassociated"
      when AEC::SecurityGroupVpcAssociationState::DisassociationFailed then "disassociation-failed"
      else
        raise Exception.new("unknown enum value for 'SecurityGroupVpcAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecurityGroupVpcAssociationState?
      case key
      when "associating"           then AEC::SecurityGroupVpcAssociationState::Associating
      when "associated"            then AEC::SecurityGroupVpcAssociationState::Associated
      when "association-failed"    then AEC::SecurityGroupVpcAssociationState::AssociationFailed
      when "disassociating"        then AEC::SecurityGroupVpcAssociationState::Disassociating
      when "disassociated"         then AEC::SecurityGroupVpcAssociationState::Disassociated
      when "disassociation-failed" then AEC::SecurityGroupVpcAssociationState::DisassociationFailed
      else
        nil
      end
    end
  end
end
