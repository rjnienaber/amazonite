private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum OperationAction
    Start
    Succeed
    Fail
    Retry
    Cancel

    def self.to_json(e : OperationAction, json : JSON::Builder) : Nil
      value = case e
              when AL::OperationAction::Start   then "START"
              when AL::OperationAction::Succeed then "SUCCEED"
              when AL::OperationAction::Fail    then "FAIL"
              when AL::OperationAction::Retry   then "RETRY"
              when AL::OperationAction::Cancel  then "CANCEL"
              else
                raise Exception.new("unknown enum value for 'OperationAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::OperationAction
      value = pull.read_string
      case value
      when "START"   then AL::OperationAction::Start
      when "SUCCEED" then AL::OperationAction::Succeed
      when "FAIL"    then AL::OperationAction::Fail
      when "RETRY"   then AL::OperationAction::Retry
      when "CANCEL"  then AL::OperationAction::Cancel
      else
        raise Exception.new("unknown enum value for 'OperationAction' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::OperationAction::Start   then "START"
      when AL::OperationAction::Succeed then "SUCCEED"
      when AL::OperationAction::Fail    then "FAIL"
      when AL::OperationAction::Retry   then "RETRY"
      when AL::OperationAction::Cancel  then "CANCEL"
      else
        raise Exception.new("unknown enum value for 'OperationAction' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::OperationAction?
      case key
      when "START"   then AL::OperationAction::Start
      when "SUCCEED" then AL::OperationAction::Succeed
      when "FAIL"    then AL::OperationAction::Fail
      when "RETRY"   then AL::OperationAction::Retry
      when "CANCEL"  then AL::OperationAction::Cancel
      else
        nil
      end
    end
  end
end
