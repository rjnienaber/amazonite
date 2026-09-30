private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum PolicyScope
    Account
    Resource

    def self.to_json(e : PolicyScope, json : JSON::Builder) : Nil
      value = case e
              when ACWL::PolicyScope::Account  then "ACCOUNT"
              when ACWL::PolicyScope::Resource then "RESOURCE"
              else
                raise Exception.new("unknown enum value for 'PolicyScope' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::PolicyScope
      value = pull.read_string
      case value
      when "ACCOUNT"  then ACWL::PolicyScope::Account
      when "RESOURCE" then ACWL::PolicyScope::Resource
      else
        raise Exception.new("unknown enum value for 'PolicyScope' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::PolicyScope::Account  then "ACCOUNT"
      when ACWL::PolicyScope::Resource then "RESOURCE"
      else
        raise Exception.new("unknown enum value for 'PolicyScope' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::PolicyScope?
      case key
      when "ACCOUNT"  then ACWL::PolicyScope::Account
      when "RESOURCE" then ACWL::PolicyScope::Resource
      else
        nil
      end
    end
  end
end
