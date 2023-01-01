private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AssociationFilterKey
    InstanceId
    Name
    AssociationId
    AssociationStatusName
    LastExecutedBefore
    LastExecutedAfter
    AssociationName
    ResourceGroupName

    def self.to_json(e : AssociationFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationFilterKey
      value = pull.read_string
      case value
      when "InstanceId"            then AS::AssociationFilterKey::InstanceId
      when "Name"                  then AS::AssociationFilterKey::Name
      when "AssociationId"         then AS::AssociationFilterKey::AssociationId
      when "AssociationStatusName" then AS::AssociationFilterKey::AssociationStatusName
      when "LastExecutedBefore"    then AS::AssociationFilterKey::LastExecutedBefore
      when "LastExecutedAfter"     then AS::AssociationFilterKey::LastExecutedAfter
      when "AssociationName"       then AS::AssociationFilterKey::AssociationName
      when "ResourceGroupName"     then AS::AssociationFilterKey::ResourceGroupName
      else
        raise Exception.new("unknown enum value for 'AssociationFilterKey' when deserializing from json: '#{value}'")
      end
    end
  end
end
