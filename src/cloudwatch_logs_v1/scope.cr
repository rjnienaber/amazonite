private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum Scope
    All

    def self.to_json(e : Scope, json : JSON::Builder) : Nil
      value = case e
              when ACWL::Scope::All then "ALL"
              else
                raise Exception.new("unknown enum value for 'Scope' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::Scope
      value = pull.read_string
      case value
      when "ALL" then ACWL::Scope::All
      else
        raise Exception.new("unknown enum value for 'Scope' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::Scope::All then "ALL"
      else
        raise Exception.new("unknown enum value for 'Scope' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::Scope?
      case key
      when "ALL" then ACWL::Scope::All
      else
        nil
      end
    end
  end
end
