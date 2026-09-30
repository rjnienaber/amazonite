private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum IndexSource
    Account
    LogGroup

    def self.to_json(e : IndexSource, json : JSON::Builder) : Nil
      value = case e
              when ACWL::IndexSource::Account  then "ACCOUNT"
              when ACWL::IndexSource::LogGroup then "LOG_GROUP"
              else
                raise Exception.new("unknown enum value for 'IndexSource' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::IndexSource
      value = pull.read_string
      case value
      when "ACCOUNT"   then ACWL::IndexSource::Account
      when "LOG_GROUP" then ACWL::IndexSource::LogGroup
      else
        raise Exception.new("unknown enum value for 'IndexSource' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::IndexSource::Account  then "ACCOUNT"
      when ACWL::IndexSource::LogGroup then "LOG_GROUP"
      else
        raise Exception.new("unknown enum value for 'IndexSource' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::IndexSource?
      case key
      when "ACCOUNT"   then ACWL::IndexSource::Account
      when "LOG_GROUP" then ACWL::IndexSource::LogGroup
      else
        nil
      end
    end
  end
end
