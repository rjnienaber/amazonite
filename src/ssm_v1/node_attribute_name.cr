private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum NodeAttributeName
    AgentVersion
    PlatformName
    PlatformType
    PlatformVersion
    Region
    ResourceType
    SourceType
    AvailabilityZone

    def self.to_json(e : NodeAttributeName, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::NodeAttributeName
      value = pull.read_string
      case value
      when "AgentVersion"     then AS::NodeAttributeName::AgentVersion
      when "PlatformName"     then AS::NodeAttributeName::PlatformName
      when "PlatformType"     then AS::NodeAttributeName::PlatformType
      when "PlatformVersion"  then AS::NodeAttributeName::PlatformVersion
      when "Region"           then AS::NodeAttributeName::Region
      when "ResourceType"     then AS::NodeAttributeName::ResourceType
      when "SourceType"       then AS::NodeAttributeName::SourceType
      when "AvailabilityZone" then AS::NodeAttributeName::AvailabilityZone
      else
        raise Exception.new("unknown enum value for 'NodeAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::NodeAttributeName?
      case key
      when "AgentVersion"     then AS::NodeAttributeName::AgentVersion
      when "PlatformName"     then AS::NodeAttributeName::PlatformName
      when "PlatformType"     then AS::NodeAttributeName::PlatformType
      when "PlatformVersion"  then AS::NodeAttributeName::PlatformVersion
      when "Region"           then AS::NodeAttributeName::Region
      when "ResourceType"     then AS::NodeAttributeName::ResourceType
      when "SourceType"       then AS::NodeAttributeName::SourceType
      when "AvailabilityZone" then AS::NodeAttributeName::AvailabilityZone
      else
        nil
      end
    end
  end
end
