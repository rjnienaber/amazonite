private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum OpenSearchResourceStatusType
    Active
    NotFound
    Error

    def self.to_json(e : OpenSearchResourceStatusType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::OpenSearchResourceStatusType::Active   then "ACTIVE"
              when ACWL::OpenSearchResourceStatusType::NotFound then "NOT_FOUND"
              when ACWL::OpenSearchResourceStatusType::Error    then "ERROR"
              else
                raise Exception.new("unknown enum value for 'OpenSearchResourceStatusType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::OpenSearchResourceStatusType
      value = pull.read_string
      case value
      when "ACTIVE"    then ACWL::OpenSearchResourceStatusType::Active
      when "NOT_FOUND" then ACWL::OpenSearchResourceStatusType::NotFound
      when "ERROR"     then ACWL::OpenSearchResourceStatusType::Error
      else
        raise Exception.new("unknown enum value for 'OpenSearchResourceStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::OpenSearchResourceStatusType::Active   then "ACTIVE"
      when ACWL::OpenSearchResourceStatusType::NotFound then "NOT_FOUND"
      when ACWL::OpenSearchResourceStatusType::Error    then "ERROR"
      else
        raise Exception.new("unknown enum value for 'OpenSearchResourceStatusType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::OpenSearchResourceStatusType?
      case key
      when "ACTIVE"    then ACWL::OpenSearchResourceStatusType::Active
      when "NOT_FOUND" then ACWL::OpenSearchResourceStatusType::NotFound
      when "ERROR"     then ACWL::OpenSearchResourceStatusType::Error
      else
        nil
      end
    end
  end
end
