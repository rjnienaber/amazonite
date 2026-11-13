private alias ASM = Amazonite::SecretsManager

module Amazonite::SecretsManager
  enum ReplicaRestrictionType
    SameOrg
    NoRestriction

    def self.to_json(e : ReplicaRestrictionType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ASM::ReplicaRestrictionType
      value = pull.read_string
      case value
      when "SameOrg"       then ASM::ReplicaRestrictionType::SameOrg
      when "NoRestriction" then ASM::ReplicaRestrictionType::NoRestriction
      else
        raise Exception.new("unknown enum value for 'ReplicaRestrictionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ASM::ReplicaRestrictionType?
      case key
      when "SameOrg"       then ASM::ReplicaRestrictionType::SameOrg
      when "NoRestriction" then ASM::ReplicaRestrictionType::NoRestriction
      else
        nil
      end
    end
  end
end
