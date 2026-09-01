private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum ThrottleReason
    ConcurrentInvocationLimitExceeded
    FunctionInvocationRateLimitExceeded
    ReservedFunctionConcurrentInvocationLimitExceeded
    ReservedFunctionInvocationRateLimitExceeded
    CallerRateLimitExceeded
    ConcurrentSnapshotCreateLimitExceeded

    def self.to_json(e : ThrottleReason, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::ThrottleReason
      value = pull.read_string
      case value
      when "ConcurrentInvocationLimitExceeded"                 then AL::ThrottleReason::ConcurrentInvocationLimitExceeded
      when "FunctionInvocationRateLimitExceeded"               then AL::ThrottleReason::FunctionInvocationRateLimitExceeded
      when "ReservedFunctionConcurrentInvocationLimitExceeded" then AL::ThrottleReason::ReservedFunctionConcurrentInvocationLimitExceeded
      when "ReservedFunctionInvocationRateLimitExceeded"       then AL::ThrottleReason::ReservedFunctionInvocationRateLimitExceeded
      when "CallerRateLimitExceeded"                           then AL::ThrottleReason::CallerRateLimitExceeded
      when "ConcurrentSnapshotCreateLimitExceeded"             then AL::ThrottleReason::ConcurrentSnapshotCreateLimitExceeded
      else
        raise Exception.new("unknown enum value for 'ThrottleReason' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::ThrottleReason?
      case key
      when "ConcurrentInvocationLimitExceeded"                 then AL::ThrottleReason::ConcurrentInvocationLimitExceeded
      when "FunctionInvocationRateLimitExceeded"               then AL::ThrottleReason::FunctionInvocationRateLimitExceeded
      when "ReservedFunctionConcurrentInvocationLimitExceeded" then AL::ThrottleReason::ReservedFunctionConcurrentInvocationLimitExceeded
      when "ReservedFunctionInvocationRateLimitExceeded"       then AL::ThrottleReason::ReservedFunctionInvocationRateLimitExceeded
      when "CallerRateLimitExceeded"                           then AL::ThrottleReason::CallerRateLimitExceeded
      when "ConcurrentSnapshotCreateLimitExceeded"             then AL::ThrottleReason::ConcurrentSnapshotCreateLimitExceeded
      else
        nil
      end
    end
  end
end
