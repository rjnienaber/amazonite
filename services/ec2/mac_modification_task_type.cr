private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MacModificationTaskType
    SipModification
    VolumeOwnershipDelegation

    def self.to_json(e : MacModificationTaskType, json : JSON::Builder) : Nil
      value = case e
              when AEC::MacModificationTaskType::SipModification           then "sip-modification"
              when AEC::MacModificationTaskType::VolumeOwnershipDelegation then "volume-ownership-delegation"
              else
                raise Exception.new("unknown enum value for 'MacModificationTaskType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MacModificationTaskType
      value = pull.read_string
      case value
      when "sip-modification"            then AEC::MacModificationTaskType::SipModification
      when "volume-ownership-delegation" then AEC::MacModificationTaskType::VolumeOwnershipDelegation
      else
        raise Exception.new("unknown enum value for 'MacModificationTaskType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MacModificationTaskType::SipModification           then "sip-modification"
      when AEC::MacModificationTaskType::VolumeOwnershipDelegation then "volume-ownership-delegation"
      else
        raise Exception.new("unknown enum value for 'MacModificationTaskType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MacModificationTaskType?
      case key
      when "sip-modification"            then AEC::MacModificationTaskType::SipModification
      when "volume-ownership-delegation" then AEC::MacModificationTaskType::VolumeOwnershipDelegation
      else
        nil
      end
    end
  end
end
