private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum DeliverySourceStatus
    Active
    Inactive

    def self.to_json(e : DeliverySourceStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::DeliverySourceStatus::Active   then "ACTIVE"
              when ACWL::DeliverySourceStatus::Inactive then "INACTIVE"
              else
                raise Exception.new("unknown enum value for 'DeliverySourceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::DeliverySourceStatus
      value = pull.read_string
      case value
      when "ACTIVE"   then ACWL::DeliverySourceStatus::Active
      when "INACTIVE" then ACWL::DeliverySourceStatus::Inactive
      else
        raise Exception.new("unknown enum value for 'DeliverySourceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::DeliverySourceStatus::Active   then "ACTIVE"
      when ACWL::DeliverySourceStatus::Inactive then "INACTIVE"
      else
        raise Exception.new("unknown enum value for 'DeliverySourceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::DeliverySourceStatus?
      case key
      when "ACTIVE"   then ACWL::DeliverySourceStatus::Active
      when "INACTIVE" then ACWL::DeliverySourceStatus::Inactive
      else
        nil
      end
    end
  end
end
