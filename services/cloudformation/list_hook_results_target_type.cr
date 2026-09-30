private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum ListHookResultsTargetType
    ChangeSet
    Stack
    Resource
    CloudControl

    def self.to_json(e : ListHookResultsTargetType, json : JSON::Builder) : Nil
      value = case e
              when ACF::ListHookResultsTargetType::ChangeSet    then "CHANGE_SET"
              when ACF::ListHookResultsTargetType::Stack        then "STACK"
              when ACF::ListHookResultsTargetType::Resource     then "RESOURCE"
              when ACF::ListHookResultsTargetType::CloudControl then "CLOUD_CONTROL"
              else
                raise Exception.new("unknown enum value for 'ListHookResultsTargetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::ListHookResultsTargetType
      value = pull.read_string
      case value
      when "CHANGE_SET"    then ACF::ListHookResultsTargetType::ChangeSet
      when "STACK"         then ACF::ListHookResultsTargetType::Stack
      when "RESOURCE"      then ACF::ListHookResultsTargetType::Resource
      when "CLOUD_CONTROL" then ACF::ListHookResultsTargetType::CloudControl
      else
        raise Exception.new("unknown enum value for 'ListHookResultsTargetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::ListHookResultsTargetType::ChangeSet    then "CHANGE_SET"
      when ACF::ListHookResultsTargetType::Stack        then "STACK"
      when ACF::ListHookResultsTargetType::Resource     then "RESOURCE"
      when ACF::ListHookResultsTargetType::CloudControl then "CLOUD_CONTROL"
      else
        raise Exception.new("unknown enum value for 'ListHookResultsTargetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::ListHookResultsTargetType?
      case key
      when "CHANGE_SET"    then ACF::ListHookResultsTargetType::ChangeSet
      when "STACK"         then ACF::ListHookResultsTargetType::Stack
      when "RESOURCE"      then ACF::ListHookResultsTargetType::Resource
      when "CLOUD_CONTROL" then ACF::ListHookResultsTargetType::CloudControl
      else
        nil
      end
    end
  end
end
