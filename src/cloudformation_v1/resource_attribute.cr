private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum ResourceAttribute
    Properties
    Metadata
    CreationPolicy
    UpdatePolicy
    DeletionPolicy
    UpdateReplacePolicy
    Tags

    def self.to_json(e : ResourceAttribute, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ResourceAttribute
      value = pull.read_string
      case value
      when "Properties"          then ACF::ResourceAttribute::Properties
      when "Metadata"            then ACF::ResourceAttribute::Metadata
      when "CreationPolicy"      then ACF::ResourceAttribute::CreationPolicy
      when "UpdatePolicy"        then ACF::ResourceAttribute::UpdatePolicy
      when "DeletionPolicy"      then ACF::ResourceAttribute::DeletionPolicy
      when "UpdateReplacePolicy" then ACF::ResourceAttribute::UpdateReplacePolicy
      when "Tags"                then ACF::ResourceAttribute::Tags
      else
        raise Exception.new("unknown enum value for 'ResourceAttribute' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::ResourceAttribute?
      case key
      when "Properties"          then ACF::ResourceAttribute::Properties
      when "Metadata"            then ACF::ResourceAttribute::Metadata
      when "CreationPolicy"      then ACF::ResourceAttribute::CreationPolicy
      when "UpdatePolicy"        then ACF::ResourceAttribute::UpdatePolicy
      when "DeletionPolicy"      then ACF::ResourceAttribute::DeletionPolicy
      when "UpdateReplacePolicy" then ACF::ResourceAttribute::UpdateReplacePolicy
      when "Tags"                then ACF::ResourceAttribute::Tags
      else
        nil
      end
    end
  end
end
