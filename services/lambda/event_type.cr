private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum EventType
    ExecutionStarted
    ExecutionSucceeded
    ExecutionFailed
    ExecutionTimedOut
    ExecutionStopped
    ContextStarted
    ContextSucceeded
    ContextFailed
    WaitStarted
    WaitSucceeded
    WaitCancelled
    StepStarted
    StepSucceeded
    StepFailed
    ChainedInvokeStarted
    ChainedInvokeSucceeded
    ChainedInvokeFailed
    ChainedInvokeTimedOut
    ChainedInvokeStopped
    CallbackStarted
    CallbackSucceeded
    CallbackFailed
    CallbackTimedOut
    InvocationCompleted

    def self.to_json(e : EventType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::EventType
      value = pull.read_string
      case value
      when "ExecutionStarted"       then AL::EventType::ExecutionStarted
      when "ExecutionSucceeded"     then AL::EventType::ExecutionSucceeded
      when "ExecutionFailed"        then AL::EventType::ExecutionFailed
      when "ExecutionTimedOut"      then AL::EventType::ExecutionTimedOut
      when "ExecutionStopped"       then AL::EventType::ExecutionStopped
      when "ContextStarted"         then AL::EventType::ContextStarted
      when "ContextSucceeded"       then AL::EventType::ContextSucceeded
      when "ContextFailed"          then AL::EventType::ContextFailed
      when "WaitStarted"            then AL::EventType::WaitStarted
      when "WaitSucceeded"          then AL::EventType::WaitSucceeded
      when "WaitCancelled"          then AL::EventType::WaitCancelled
      when "StepStarted"            then AL::EventType::StepStarted
      when "StepSucceeded"          then AL::EventType::StepSucceeded
      when "StepFailed"             then AL::EventType::StepFailed
      when "ChainedInvokeStarted"   then AL::EventType::ChainedInvokeStarted
      when "ChainedInvokeSucceeded" then AL::EventType::ChainedInvokeSucceeded
      when "ChainedInvokeFailed"    then AL::EventType::ChainedInvokeFailed
      when "ChainedInvokeTimedOut"  then AL::EventType::ChainedInvokeTimedOut
      when "ChainedInvokeStopped"   then AL::EventType::ChainedInvokeStopped
      when "CallbackStarted"        then AL::EventType::CallbackStarted
      when "CallbackSucceeded"      then AL::EventType::CallbackSucceeded
      when "CallbackFailed"         then AL::EventType::CallbackFailed
      when "CallbackTimedOut"       then AL::EventType::CallbackTimedOut
      when "InvocationCompleted"    then AL::EventType::InvocationCompleted
      else
        raise Exception.new("unknown enum value for 'EventType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::EventType?
      case key
      when "ExecutionStarted"       then AL::EventType::ExecutionStarted
      when "ExecutionSucceeded"     then AL::EventType::ExecutionSucceeded
      when "ExecutionFailed"        then AL::EventType::ExecutionFailed
      when "ExecutionTimedOut"      then AL::EventType::ExecutionTimedOut
      when "ExecutionStopped"       then AL::EventType::ExecutionStopped
      when "ContextStarted"         then AL::EventType::ContextStarted
      when "ContextSucceeded"       then AL::EventType::ContextSucceeded
      when "ContextFailed"          then AL::EventType::ContextFailed
      when "WaitStarted"            then AL::EventType::WaitStarted
      when "WaitSucceeded"          then AL::EventType::WaitSucceeded
      when "WaitCancelled"          then AL::EventType::WaitCancelled
      when "StepStarted"            then AL::EventType::StepStarted
      when "StepSucceeded"          then AL::EventType::StepSucceeded
      when "StepFailed"             then AL::EventType::StepFailed
      when "ChainedInvokeStarted"   then AL::EventType::ChainedInvokeStarted
      when "ChainedInvokeSucceeded" then AL::EventType::ChainedInvokeSucceeded
      when "ChainedInvokeFailed"    then AL::EventType::ChainedInvokeFailed
      when "ChainedInvokeTimedOut"  then AL::EventType::ChainedInvokeTimedOut
      when "ChainedInvokeStopped"   then AL::EventType::ChainedInvokeStopped
      when "CallbackStarted"        then AL::EventType::CallbackStarted
      when "CallbackSucceeded"      then AL::EventType::CallbackSucceeded
      when "CallbackFailed"         then AL::EventType::CallbackFailed
      when "CallbackTimedOut"       then AL::EventType::CallbackTimedOut
      when "InvocationCompleted"    then AL::EventType::InvocationCompleted
      else
        nil
      end
    end
  end
end
