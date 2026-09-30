private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum OperationType
    Execution
    Context
    Step
    Wait
    Callback
    ChainedInvoke

    def self.to_json(e : OperationType, json : JSON::Builder) : Nil
      value = case e
              when AL::OperationType::Execution     then "EXECUTION"
              when AL::OperationType::Context       then "CONTEXT"
              when AL::OperationType::Step          then "STEP"
              when AL::OperationType::Wait          then "WAIT"
              when AL::OperationType::Callback      then "CALLBACK"
              when AL::OperationType::ChainedInvoke then "CHAINED_INVOKE"
              else
                raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::OperationType
      value = pull.read_string
      case value
      when "EXECUTION"      then AL::OperationType::Execution
      when "CONTEXT"        then AL::OperationType::Context
      when "STEP"           then AL::OperationType::Step
      when "WAIT"           then AL::OperationType::Wait
      when "CALLBACK"       then AL::OperationType::Callback
      when "CHAINED_INVOKE" then AL::OperationType::ChainedInvoke
      else
        raise Exception.new("unknown enum value for 'OperationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::OperationType::Execution     then "EXECUTION"
      when AL::OperationType::Context       then "CONTEXT"
      when AL::OperationType::Step          then "STEP"
      when AL::OperationType::Wait          then "WAIT"
      when AL::OperationType::Callback      then "CALLBACK"
      when AL::OperationType::ChainedInvoke then "CHAINED_INVOKE"
      else
        raise Exception.new("unknown enum value for 'OperationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::OperationType?
      case key
      when "EXECUTION"      then AL::OperationType::Execution
      when "CONTEXT"        then AL::OperationType::Context
      when "STEP"           then AL::OperationType::Step
      when "WAIT"           then AL::OperationType::Wait
      when "CALLBACK"       then AL::OperationType::Callback
      when "CHAINED_INVOKE" then AL::OperationType::ChainedInvoke
      else
        nil
      end
    end
  end
end
