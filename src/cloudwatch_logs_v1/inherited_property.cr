private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum InheritedProperty
    AccountDataProtection

    def self.to_json(e : InheritedProperty, json : JSON::Builder) : Nil
      value = case e
              when ACWL::InheritedProperty::AccountDataProtection then "ACCOUNT_DATA_PROTECTION"
              else
                raise Exception.new("unknown enum value for 'InheritedProperty' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::InheritedProperty
      value = pull.read_string
      case value
      when "ACCOUNT_DATA_PROTECTION" then ACWL::InheritedProperty::AccountDataProtection
      else
        raise Exception.new("unknown enum value for 'InheritedProperty' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::InheritedProperty::AccountDataProtection then "ACCOUNT_DATA_PROTECTION"
      else
        raise Exception.new("unknown enum value for 'InheritedProperty' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::InheritedProperty?
      case key
      when "ACCOUNT_DATA_PROTECTION" then ACWL::InheritedProperty::AccountDataProtection
      else
        nil
      end
    end
  end
end
