private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum MaintenanceWindowResourceType
    Instance
    ResourceGroup

    def self.to_json(e : MaintenanceWindowResourceType, json : JSON::Builder) : Nil
      value = case e
              when AS::MaintenanceWindowResourceType::Instance      then "INSTANCE"
              when AS::MaintenanceWindowResourceType::ResourceGroup then "RESOURCE_GROUP"
              else
                raise Exception.new("unknown enum value for 'MaintenanceWindowResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MaintenanceWindowResourceType
      value = pull.read_string
      case value
      when "INSTANCE"       then AS::MaintenanceWindowResourceType::Instance
      when "RESOURCE_GROUP" then AS::MaintenanceWindowResourceType::ResourceGroup
      else
        raise Exception.new("unknown enum value for 'MaintenanceWindowResourceType' when deserializing from json: '#{value}'")
      end
    end
  end
end
