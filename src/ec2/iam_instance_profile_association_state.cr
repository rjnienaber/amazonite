private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IamInstanceProfileAssociationState
    Associating
    Associated
    Disassociating
    Disassociated

    def self.to_json(e : IamInstanceProfileAssociationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::IamInstanceProfileAssociationState::Associating    then "associating"
              when AEC::IamInstanceProfileAssociationState::Associated     then "associated"
              when AEC::IamInstanceProfileAssociationState::Disassociating then "disassociating"
              when AEC::IamInstanceProfileAssociationState::Disassociated  then "disassociated"
              else
                raise Exception.new("unknown enum value for 'IamInstanceProfileAssociationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IamInstanceProfileAssociationState
      value = pull.read_string
      case value
      when "associating"    then AEC::IamInstanceProfileAssociationState::Associating
      when "associated"     then AEC::IamInstanceProfileAssociationState::Associated
      when "disassociating" then AEC::IamInstanceProfileAssociationState::Disassociating
      when "disassociated"  then AEC::IamInstanceProfileAssociationState::Disassociated
      else
        raise Exception.new("unknown enum value for 'IamInstanceProfileAssociationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IamInstanceProfileAssociationState::Associating    then "associating"
      when AEC::IamInstanceProfileAssociationState::Associated     then "associated"
      when AEC::IamInstanceProfileAssociationState::Disassociating then "disassociating"
      when AEC::IamInstanceProfileAssociationState::Disassociated  then "disassociated"
      else
        raise Exception.new("unknown enum value for 'IamInstanceProfileAssociationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IamInstanceProfileAssociationState?
      case key
      when "associating"    then AEC::IamInstanceProfileAssociationState::Associating
      when "associated"     then AEC::IamInstanceProfileAssociationState::Associated
      when "disassociating" then AEC::IamInstanceProfileAssociationState::Disassociating
      when "disassociated"  then AEC::IamInstanceProfileAssociationState::Disassociated
      else
        nil
      end
    end
  end
end
