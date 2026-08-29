private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackSetOperationAction
    Create
    Update
    Delete
    DetectDrift

    def self.to_json(e : StackSetOperationAction, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetOperationAction::Create      then "CREATE"
              when ACF::StackSetOperationAction::Update      then "UPDATE"
              when ACF::StackSetOperationAction::Delete      then "DELETE"
              when ACF::StackSetOperationAction::DetectDrift then "DETECT_DRIFT"
              else
                raise Exception.new("unknown enum value for 'StackSetOperationAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetOperationAction
      value = pull.read_string
      case value
      when "CREATE"       then ACF::StackSetOperationAction::Create
      when "UPDATE"       then ACF::StackSetOperationAction::Update
      when "DELETE"       then ACF::StackSetOperationAction::Delete
      when "DETECT_DRIFT" then ACF::StackSetOperationAction::DetectDrift
      else
        raise Exception.new("unknown enum value for 'StackSetOperationAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetOperationAction::Create      then "CREATE"
      when ACF::StackSetOperationAction::Update      then "UPDATE"
      when ACF::StackSetOperationAction::Delete      then "DELETE"
      when ACF::StackSetOperationAction::DetectDrift then "DETECT_DRIFT"
      else
        raise Exception.new("unknown enum value for 'StackSetOperationAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetOperationAction?
      case key
      when "CREATE"       then ACF::StackSetOperationAction::Create
      when "UPDATE"       then ACF::StackSetOperationAction::Update
      when "DELETE"       then ACF::StackSetOperationAction::Delete
      when "DETECT_DRIFT" then ACF::StackSetOperationAction::DetectDrift
      else
        nil
      end
    end
  end
end
