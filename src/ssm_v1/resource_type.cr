private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ResourceType
    ManagedInstance
    Document
    Ec2Instance

    def self.to_json(e : ResourceType, json : JSON::Builder) : Nil
      value = case e
              when AS::ResourceType::ManagedInstance then "ManagedInstance"
              when AS::ResourceType::Document        then "Document"
              when AS::ResourceType::Ec2Instance     then "EC2Instance"
              else
                raise Exception.new("unknown enum value for 'ResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ResourceType
      value = pull.read_string
      case value
      when "ManagedInstance" then AS::ResourceType::ManagedInstance
      when "Document"        then AS::ResourceType::Document
      when "EC2Instance"     then AS::ResourceType::Ec2Instance
      else
        raise Exception.new("unknown enum value for 'ResourceType' when deserializing from json: '#{value}'")
      end
    end
  end
end
