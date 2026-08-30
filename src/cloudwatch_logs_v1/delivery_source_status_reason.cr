private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum DeliverySourceStatusReason
    ResourceDeleted

    def self.to_json(e : DeliverySourceStatusReason, json : JSON::Builder) : Nil
      value = case e
              when ACWL::DeliverySourceStatusReason::ResourceDeleted then "RESOURCE_DELETED"
              else
                raise Exception.new("unknown enum value for 'DeliverySourceStatusReason' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::DeliverySourceStatusReason
      value = pull.read_string
      case value
      when "RESOURCE_DELETED" then ACWL::DeliverySourceStatusReason::ResourceDeleted
      else
        raise Exception.new("unknown enum value for 'DeliverySourceStatusReason' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::DeliverySourceStatusReason::ResourceDeleted then "RESOURCE_DELETED"
      else
        raise Exception.new("unknown enum value for 'DeliverySourceStatusReason' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::DeliverySourceStatusReason?
      case key
      when "RESOURCE_DELETED" then ACWL::DeliverySourceStatusReason::ResourceDeleted
      else
        nil
      end
    end
  end
end
