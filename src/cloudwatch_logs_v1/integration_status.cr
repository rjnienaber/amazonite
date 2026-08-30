private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum IntegrationStatus
    Provisioning
    Active
    Failed

    def self.to_json(e : IntegrationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::IntegrationStatus::Provisioning then "PROVISIONING"
              when ACWL::IntegrationStatus::Active       then "ACTIVE"
              when ACWL::IntegrationStatus::Failed       then "FAILED"
              else
                raise Exception.new("unknown enum value for 'IntegrationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::IntegrationStatus
      value = pull.read_string
      case value
      when "PROVISIONING" then ACWL::IntegrationStatus::Provisioning
      when "ACTIVE"       then ACWL::IntegrationStatus::Active
      when "FAILED"       then ACWL::IntegrationStatus::Failed
      else
        raise Exception.new("unknown enum value for 'IntegrationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::IntegrationStatus::Provisioning then "PROVISIONING"
      when ACWL::IntegrationStatus::Active       then "ACTIVE"
      when ACWL::IntegrationStatus::Failed       then "FAILED"
      else
        raise Exception.new("unknown enum value for 'IntegrationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::IntegrationStatus?
      case key
      when "PROVISIONING" then ACWL::IntegrationStatus::Provisioning
      when "ACTIVE"       then ACWL::IntegrationStatus::Active
      when "FAILED"       then ACWL::IntegrationStatus::Failed
      else
        nil
      end
    end
  end
end
