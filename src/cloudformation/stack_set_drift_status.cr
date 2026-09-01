private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StackSetDriftStatus
    Drifted
    InSync
    NotChecked

    def self.to_json(e : StackSetDriftStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetDriftStatus::Drifted    then "DRIFTED"
              when ACF::StackSetDriftStatus::InSync     then "IN_SYNC"
              when ACF::StackSetDriftStatus::NotChecked then "NOT_CHECKED"
              else
                raise Exception.new("unknown enum value for 'StackSetDriftStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetDriftStatus
      value = pull.read_string
      case value
      when "DRIFTED"     then ACF::StackSetDriftStatus::Drifted
      when "IN_SYNC"     then ACF::StackSetDriftStatus::InSync
      when "NOT_CHECKED" then ACF::StackSetDriftStatus::NotChecked
      else
        raise Exception.new("unknown enum value for 'StackSetDriftStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetDriftStatus::Drifted    then "DRIFTED"
      when ACF::StackSetDriftStatus::InSync     then "IN_SYNC"
      when ACF::StackSetDriftStatus::NotChecked then "NOT_CHECKED"
      else
        raise Exception.new("unknown enum value for 'StackSetDriftStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetDriftStatus?
      case key
      when "DRIFTED"     then ACF::StackSetDriftStatus::Drifted
      when "IN_SYNC"     then ACF::StackSetDriftStatus::InSync
      when "NOT_CHECKED" then ACF::StackSetDriftStatus::NotChecked
      else
        nil
      end
    end
  end
end
