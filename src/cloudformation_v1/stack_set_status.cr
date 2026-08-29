private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackSetStatus
    Active
    Deleted

    def self.to_json(e : StackSetStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetStatus::Active  then "ACTIVE"
              when ACF::StackSetStatus::Deleted then "DELETED"
              else
                raise Exception.new("unknown enum value for 'StackSetStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetStatus
      value = pull.read_string
      case value
      when "ACTIVE"  then ACF::StackSetStatus::Active
      when "DELETED" then ACF::StackSetStatus::Deleted
      else
        raise Exception.new("unknown enum value for 'StackSetStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetStatus::Active  then "ACTIVE"
      when ACF::StackSetStatus::Deleted then "DELETED"
      else
        raise Exception.new("unknown enum value for 'StackSetStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetStatus?
      case key
      when "ACTIVE"  then ACF::StackSetStatus::Active
      when "DELETED" then ACF::StackSetStatus::Deleted
      else
        nil
      end
    end
  end
end
