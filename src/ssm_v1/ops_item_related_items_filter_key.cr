private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemRelatedItemsFilterKey
    ResourceType
    AssociationId
    ResourceUri

    def self.to_json(e : OpsItemRelatedItemsFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemRelatedItemsFilterKey
      value = pull.read_string
      case value
      when "ResourceType"  then AS::OpsItemRelatedItemsFilterKey::ResourceType
      when "AssociationId" then AS::OpsItemRelatedItemsFilterKey::AssociationId
      when "ResourceUri"   then AS::OpsItemRelatedItemsFilterKey::ResourceUri
      else
        raise Exception.new("unknown enum value for 'OpsItemRelatedItemsFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
