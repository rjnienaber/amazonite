private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum LogGroupClass
    Standard
    InfrequentAccess
    Delivery

    def self.to_json(e : LogGroupClass, json : JSON::Builder) : Nil
      value = case e
              when ACWL::LogGroupClass::Standard         then "STANDARD"
              when ACWL::LogGroupClass::InfrequentAccess then "INFREQUENT_ACCESS"
              when ACWL::LogGroupClass::Delivery         then "DELIVERY"
              else
                raise Exception.new("unknown enum value for 'LogGroupClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::LogGroupClass
      value = pull.read_string
      case value
      when "STANDARD"          then ACWL::LogGroupClass::Standard
      when "INFREQUENT_ACCESS" then ACWL::LogGroupClass::InfrequentAccess
      when "DELIVERY"          then ACWL::LogGroupClass::Delivery
      else
        raise Exception.new("unknown enum value for 'LogGroupClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::LogGroupClass::Standard         then "STANDARD"
      when ACWL::LogGroupClass::InfrequentAccess then "INFREQUENT_ACCESS"
      when ACWL::LogGroupClass::Delivery         then "DELIVERY"
      else
        raise Exception.new("unknown enum value for 'LogGroupClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::LogGroupClass?
      case key
      when "STANDARD"          then ACWL::LogGroupClass::Standard
      when "INFREQUENT_ACCESS" then ACWL::LogGroupClass::InfrequentAccess
      when "DELIVERY"          then ACWL::LogGroupClass::Delivery
      else
        nil
      end
    end
  end
end
