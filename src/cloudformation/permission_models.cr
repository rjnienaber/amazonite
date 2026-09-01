private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum PermissionModels
    ServiceManaged
    SelfManaged

    def self.to_json(e : PermissionModels, json : JSON::Builder) : Nil
      value = case e
              when ACF::PermissionModels::ServiceManaged then "SERVICE_MANAGED"
              when ACF::PermissionModels::SelfManaged    then "SELF_MANAGED"
              else
                raise Exception.new("unknown enum value for 'PermissionModels' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::PermissionModels
      value = pull.read_string
      case value
      when "SERVICE_MANAGED" then ACF::PermissionModels::ServiceManaged
      when "SELF_MANAGED"    then ACF::PermissionModels::SelfManaged
      else
        raise Exception.new("unknown enum value for 'PermissionModels' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::PermissionModels::ServiceManaged then "SERVICE_MANAGED"
      when ACF::PermissionModels::SelfManaged    then "SELF_MANAGED"
      else
        raise Exception.new("unknown enum value for 'PermissionModels' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::PermissionModels?
      case key
      when "SERVICE_MANAGED" then ACF::PermissionModels::ServiceManaged
      when "SELF_MANAGED"    then ACF::PermissionModels::SelfManaged
      else
        nil
      end
    end
  end
end
