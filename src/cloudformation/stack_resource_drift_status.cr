private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StackResourceDriftStatus
    InSync
    Modified
    Deleted
    NotChecked
    Unknown
    Unsupported

    def self.to_json(e : StackResourceDriftStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackResourceDriftStatus::InSync      then "IN_SYNC"
              when ACF::StackResourceDriftStatus::Modified    then "MODIFIED"
              when ACF::StackResourceDriftStatus::Deleted     then "DELETED"
              when ACF::StackResourceDriftStatus::NotChecked  then "NOT_CHECKED"
              when ACF::StackResourceDriftStatus::Unknown     then "UNKNOWN"
              when ACF::StackResourceDriftStatus::Unsupported then "UNSUPPORTED"
              else
                raise Exception.new("unknown enum value for 'StackResourceDriftStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackResourceDriftStatus
      value = pull.read_string
      case value
      when "IN_SYNC"     then ACF::StackResourceDriftStatus::InSync
      when "MODIFIED"    then ACF::StackResourceDriftStatus::Modified
      when "DELETED"     then ACF::StackResourceDriftStatus::Deleted
      when "NOT_CHECKED" then ACF::StackResourceDriftStatus::NotChecked
      when "UNKNOWN"     then ACF::StackResourceDriftStatus::Unknown
      when "UNSUPPORTED" then ACF::StackResourceDriftStatus::Unsupported
      else
        raise Exception.new("unknown enum value for 'StackResourceDriftStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackResourceDriftStatus::InSync      then "IN_SYNC"
      when ACF::StackResourceDriftStatus::Modified    then "MODIFIED"
      when ACF::StackResourceDriftStatus::Deleted     then "DELETED"
      when ACF::StackResourceDriftStatus::NotChecked  then "NOT_CHECKED"
      when ACF::StackResourceDriftStatus::Unknown     then "UNKNOWN"
      when ACF::StackResourceDriftStatus::Unsupported then "UNSUPPORTED"
      else
        raise Exception.new("unknown enum value for 'StackResourceDriftStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackResourceDriftStatus?
      case key
      when "IN_SYNC"     then ACF::StackResourceDriftStatus::InSync
      when "MODIFIED"    then ACF::StackResourceDriftStatus::Modified
      when "DELETED"     then ACF::StackResourceDriftStatus::Deleted
      when "NOT_CHECKED" then ACF::StackResourceDriftStatus::NotChecked
      when "UNKNOWN"     then ACF::StackResourceDriftStatus::Unknown
      when "UNSUPPORTED" then ACF::StackResourceDriftStatus::Unsupported
      else
        nil
      end
    end
  end
end
