private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackRefactorActionEntity
    Resource
    Stack

    def self.to_json(e : StackRefactorActionEntity, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackRefactorActionEntity::Resource then "RESOURCE"
              when ACF::StackRefactorActionEntity::Stack    then "STACK"
              else
                raise Exception.new("unknown enum value for 'StackRefactorActionEntity' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackRefactorActionEntity
      value = pull.read_string
      case value
      when "RESOURCE" then ACF::StackRefactorActionEntity::Resource
      when "STACK"    then ACF::StackRefactorActionEntity::Stack
      else
        raise Exception.new("unknown enum value for 'StackRefactorActionEntity' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackRefactorActionEntity::Resource then "RESOURCE"
      when ACF::StackRefactorActionEntity::Stack    then "STACK"
      else
        raise Exception.new("unknown enum value for 'StackRefactorActionEntity' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackRefactorActionEntity?
      case key
      when "RESOURCE" then ACF::StackRefactorActionEntity::Resource
      when "STACK"    then ACF::StackRefactorActionEntity::Stack
      else
        nil
      end
    end
  end
end
