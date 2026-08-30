private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackDriftStatus
    Drifted
    InSync
    Unknown
    NotChecked

    def self.to_json(e : StackDriftStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackDriftStatus::Drifted    then "DRIFTED"
              when ACF::StackDriftStatus::InSync     then "IN_SYNC"
              when ACF::StackDriftStatus::Unknown    then "UNKNOWN"
              when ACF::StackDriftStatus::NotChecked then "NOT_CHECKED"
              else
                raise Exception.new("unknown enum value for 'StackDriftStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackDriftStatus
      value = pull.read_string
      case value
      when "DRIFTED"     then ACF::StackDriftStatus::Drifted
      when "IN_SYNC"     then ACF::StackDriftStatus::InSync
      when "UNKNOWN"     then ACF::StackDriftStatus::Unknown
      when "NOT_CHECKED" then ACF::StackDriftStatus::NotChecked
      else
        raise Exception.new("unknown enum value for 'StackDriftStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackDriftStatus::Drifted    then "DRIFTED"
      when ACF::StackDriftStatus::InSync     then "IN_SYNC"
      when ACF::StackDriftStatus::Unknown    then "UNKNOWN"
      when ACF::StackDriftStatus::NotChecked then "NOT_CHECKED"
      else
        raise Exception.new("unknown enum value for 'StackDriftStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackDriftStatus?
      case key
      when "DRIFTED"     then ACF::StackDriftStatus::Drifted
      when "IN_SYNC"     then ACF::StackDriftStatus::InSync
      when "UNKNOWN"     then ACF::StackDriftStatus::Unknown
      when "NOT_CHECKED" then ACF::StackDriftStatus::NotChecked
      else
        nil
      end
    end
  end
end
