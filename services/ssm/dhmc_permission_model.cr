private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DHMCPermissionModel
    ServiceManaged
    SelfManaged

    def self.to_json(e : DHMCPermissionModel, json : JSON::Builder) : Nil
      value = case e
              when AS::DHMCPermissionModel::ServiceManaged then "SERVICE_MANAGED"
              when AS::DHMCPermissionModel::SelfManaged    then "SELF_MANAGED"
              else
                raise Exception.new("unknown enum value for 'DHMCPermissionModel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DHMCPermissionModel
      value = pull.read_string
      case value
      when "SERVICE_MANAGED" then AS::DHMCPermissionModel::ServiceManaged
      when "SELF_MANAGED"    then AS::DHMCPermissionModel::SelfManaged
      else
        raise Exception.new("unknown enum value for 'DHMCPermissionModel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::DHMCPermissionModel::ServiceManaged then "SERVICE_MANAGED"
      when AS::DHMCPermissionModel::SelfManaged    then "SELF_MANAGED"
      else
        raise Exception.new("unknown enum value for 'DHMCPermissionModel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::DHMCPermissionModel?
      case key
      when "SERVICE_MANAGED" then AS::DHMCPermissionModel::ServiceManaged
      when "SELF_MANAGED"    then AS::DHMCPermissionModel::SelfManaged
      else
        nil
      end
    end
  end
end
