private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum DataProtectionStatus
    Activated
    Deleted
    Archived
    Disabled

    def self.to_json(e : DataProtectionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::DataProtectionStatus::Activated then "ACTIVATED"
              when ACWL::DataProtectionStatus::Deleted   then "DELETED"
              when ACWL::DataProtectionStatus::Archived  then "ARCHIVED"
              when ACWL::DataProtectionStatus::Disabled  then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'DataProtectionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::DataProtectionStatus
      value = pull.read_string
      case value
      when "ACTIVATED" then ACWL::DataProtectionStatus::Activated
      when "DELETED"   then ACWL::DataProtectionStatus::Deleted
      when "ARCHIVED"  then ACWL::DataProtectionStatus::Archived
      when "DISABLED"  then ACWL::DataProtectionStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'DataProtectionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::DataProtectionStatus::Activated then "ACTIVATED"
      when ACWL::DataProtectionStatus::Deleted   then "DELETED"
      when ACWL::DataProtectionStatus::Archived  then "ARCHIVED"
      when ACWL::DataProtectionStatus::Disabled  then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'DataProtectionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::DataProtectionStatus?
      case key
      when "ACTIVATED" then ACWL::DataProtectionStatus::Activated
      when "DELETED"   then ACWL::DataProtectionStatus::Deleted
      when "ARCHIVED"  then ACWL::DataProtectionStatus::Archived
      when "DISABLED"  then ACWL::DataProtectionStatus::Disabled
      else
        nil
      end
    end
  end
end
