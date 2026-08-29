private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ValidationFindingScopeType
    AzureTenant
    AzureSubscription

    def self.to_json(e : ValidationFindingScopeType, json : JSON::Builder) : Nil
      value = case e
              when AS::ValidationFindingScopeType::AzureTenant       then "azure:tenant"
              when AS::ValidationFindingScopeType::AzureSubscription then "azure:subscription"
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
      else
        raise Exception.new("unknown enum value for 'ValidationFindingScopeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ValidationFindingScopeType::AzureTenant       then "azure:tenant"
      when AS::ValidationFindingScopeType::AzureSubscription then "azure:subscription"
      else
        raise Exception.new("unknown enum value for 'ValidationFindingScopeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ValidationFindingScopeType?
      case key
      when "azure:tenant"       then AS::ValidationFindingScopeType::AzureTenant
      when "azure:subscription" then AS::ValidationFindingScopeType::AzureSubscription
      else
        nil
      end
    end
  end
end
