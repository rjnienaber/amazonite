private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AssociationExecutionTargetsFilterKey
    Status
    ResourceId
    ResourceType

    def self.to_json(e : AssociationExecutionTargetsFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationExecutionTargetsFilterKey
      value = pull.read_string
      case value
      when "Status"       then AS::AssociationExecutionTargetsFilterKey::Status
      when "ResourceId"   then AS::AssociationExecutionTargetsFilterKey::ResourceId
      when "ResourceType" then AS::AssociationExecutionTargetsFilterKey::ResourceType
      else
        raise Exception.new("unknown enum value for 'AssociationExecutionTargetsFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
