private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum TenantIsolationMode
    PerTenant

    def self.to_json(e : TenantIsolationMode, json : JSON::Builder) : Nil
      value = case e
              when AL::TenantIsolationMode::PerTenant then "PER_TENANT"
              else
                raise Exception.new("unknown enum value for 'TenantIsolationMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::TenantIsolationMode
      value = pull.read_string
      case value
      when "PER_TENANT" then AL::TenantIsolationMode::PerTenant
      else
        raise Exception.new("unknown enum value for 'TenantIsolationMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::TenantIsolationMode::PerTenant then "PER_TENANT"
      else
        raise Exception.new("unknown enum value for 'TenantIsolationMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::TenantIsolationMode?
      case key
      when "PER_TENANT" then AL::TenantIsolationMode::PerTenant
      else
        nil
      end
    end
  end
end
