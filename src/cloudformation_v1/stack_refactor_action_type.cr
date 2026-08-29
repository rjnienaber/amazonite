private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackRefactorActionType
    Move
    Create

    def self.to_json(e : StackRefactorActionType, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackRefactorActionType::Move   then "MOVE"
              when ACF::StackRefactorActionType::Create then "CREATE"
              else
                raise Exception.new("unknown enum value for 'StackRefactorActionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackRefactorActionType
      value = pull.read_string
      case value
      when "MOVE"   then ACF::StackRefactorActionType::Move
      when "CREATE" then ACF::StackRefactorActionType::Create
      else
        raise Exception.new("unknown enum value for 'StackRefactorActionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackRefactorActionType::Move   then "MOVE"
      when ACF::StackRefactorActionType::Create then "CREATE"
      else
        raise Exception.new("unknown enum value for 'StackRefactorActionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackRefactorActionType?
      case key
      when "MOVE"   then ACF::StackRefactorActionType::Move
      when "CREATE" then ACF::StackRefactorActionType::Create
      else
        nil
      end
    end
  end
end
