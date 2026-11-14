private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum ValidationFindingScopeType
    AzureTenant
    AzureSubscription
    GcpOrganization
    GcpProject

    def self.to_json(e : ValidationFindingScopeType, json : JSON::Builder) : Nil
      value = case e
              when AS::ValidationFindingScopeType::AzureTenant       then "azure:tenant"
              when AS::ValidationFindingScopeType::AzureSubscription then "azure:subscription"
              when AS::ValidationFindingScopeType::GcpOrganization   then "gcp:organization"
              when AS::ValidationFindingScopeType::GcpProject        then "gcp:project"
              else
                raise Exception.new("unknown enum value for 'ValidationFindingScopeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ValidationFindingScopeType
      value = pull.read_string
      case value
      when "azure:tenant"       then AS::ValidationFindingScopeType::AzureTenant
      when "azure:subscription" then AS::ValidationFindingScopeType::AzureSubscription
      when "gcp:organization"   then AS::ValidationFindingScopeType::GcpOrganization
      when "gcp:project"        then AS::ValidationFindingScopeType::GcpProject
      else
        raise Exception.new("unknown enum value for 'ValidationFindingScopeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ValidationFindingScopeType::AzureTenant       then "azure:tenant"
      when AS::ValidationFindingScopeType::AzureSubscription then "azure:subscription"
      when AS::ValidationFindingScopeType::GcpOrganization   then "gcp:organization"
      when AS::ValidationFindingScopeType::GcpProject        then "gcp:project"
      else
        raise Exception.new("unknown enum value for 'ValidationFindingScopeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ValidationFindingScopeType?
      case key
      when "azure:tenant"       then AS::ValidationFindingScopeType::AzureTenant
      when "azure:subscription" then AS::ValidationFindingScopeType::AzureSubscription
      when "gcp:organization"   then AS::ValidationFindingScopeType::GcpOrganization
      when "gcp:project"        then AS::ValidationFindingScopeType::GcpProject
      else
        nil
      end
    end
  end
end
