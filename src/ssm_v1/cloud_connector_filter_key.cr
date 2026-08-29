private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum CloudConnectorFilterKey
    SubscriptionId
    TenantId

    def self.to_json(e : CloudConnectorFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CloudConnectorFilterKey
      value = pull.read_string
      case value
      when "SubscriptionId" then AS::CloudConnectorFilterKey::SubscriptionId
      when "TenantId"       then AS::CloudConnectorFilterKey::TenantId
      else
        raise Exception.new("unknown enum value for 'CloudConnectorFilterKey' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::CloudConnectorFilterKey?
      case key
      when "SubscriptionId" then AS::CloudConnectorFilterKey::SubscriptionId
      when "TenantId"       then AS::CloudConnectorFilterKey::TenantId
      else
        nil
      end
    end
  end
end
