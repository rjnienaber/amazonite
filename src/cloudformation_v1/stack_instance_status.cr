private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackInstanceStatus
    Current
    Outdated
    Inoperable

    def self.to_json(e : StackInstanceStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackInstanceStatus::Current    then "CURRENT"
              when ACF::StackInstanceStatus::Outdated   then "OUTDATED"
              when ACF::StackInstanceStatus::Inoperable then "INOPERABLE"
              else
                raise Exception.new("unknown enum value for 'StackInstanceStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackInstanceStatus
      value = pull.read_string
      case value
      when "CURRENT"    then ACF::StackInstanceStatus::Current
      when "OUTDATED"   then ACF::StackInstanceStatus::Outdated
      when "INOPERABLE" then ACF::StackInstanceStatus::Inoperable
      else
        raise Exception.new("unknown enum value for 'StackInstanceStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackInstanceStatus::Current    then "CURRENT"
      when ACF::StackInstanceStatus::Outdated   then "OUTDATED"
      when ACF::StackInstanceStatus::Inoperable then "INOPERABLE"
      else
        raise Exception.new("unknown enum value for 'StackInstanceStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackInstanceStatus?
      case key
      when "CURRENT"    then ACF::StackInstanceStatus::Current
      when "OUTDATED"   then ACF::StackInstanceStatus::Outdated
      when "INOPERABLE" then ACF::StackInstanceStatus::Inoperable
      else
        nil
      end
    end
  end
end
