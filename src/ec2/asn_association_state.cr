private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AsnAssociationState
    Disassociated
    FailedDisassociation
    FailedAssociation
    PendingDisassociation
    PendingAssociation
    Associated

    def self.to_json(e : AsnAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AsnAssociationState::Disassociated         then "disassociated"
              when AEC::AsnAssociationState::FailedDisassociation  then "failed-disassociation"
              when AEC::AsnAssociationState::FailedAssociation     then "failed-association"
              when AEC::AsnAssociationState::PendingDisassociation then "pending-disassociation"
              when AEC::AsnAssociationState::PendingAssociation    then "pending-association"
              when AEC::AsnAssociationState::Associated            then "associated"
              else
                raise Exception.new("unknown enum value for 'AsnAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AsnAssociationState
      value = pull.read_string
      case value
      when "disassociated"          then AEC::AsnAssociationState::Disassociated
      when "failed-disassociation"  then AEC::AsnAssociationState::FailedDisassociation
      when "failed-association"     then AEC::AsnAssociationState::FailedAssociation
      when "pending-disassociation" then AEC::AsnAssociationState::PendingDisassociation
      when "pending-association"    then AEC::AsnAssociationState::PendingAssociation
      when "associated"             then AEC::AsnAssociationState::Associated
      else
        raise Exception.new("unknown enum value for 'AsnAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AsnAssociationState::Disassociated         then "disassociated"
      when AEC::AsnAssociationState::FailedDisassociation  then "failed-disassociation"
      when AEC::AsnAssociationState::FailedAssociation     then "failed-association"
      when AEC::AsnAssociationState::PendingDisassociation then "pending-disassociation"
      when AEC::AsnAssociationState::PendingAssociation    then "pending-association"
      when AEC::AsnAssociationState::Associated            then "associated"
      else
        raise Exception.new("unknown enum value for 'AsnAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AsnAssociationState?
      case key
      when "disassociated"          then AEC::AsnAssociationState::Disassociated
      when "failed-disassociation"  then AEC::AsnAssociationState::FailedDisassociation
      when "failed-association"     then AEC::AsnAssociationState::FailedAssociation
      when "pending-disassociation" then AEC::AsnAssociationState::PendingDisassociation
      when "pending-association"    then AEC::AsnAssociationState::PendingAssociation
      when "associated"             then AEC::AsnAssociationState::Associated
      else
        nil
      end
    end
  end
end
