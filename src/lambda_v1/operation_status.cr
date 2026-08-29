private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum OperationStatus
    Started
    Pending
    Ready
    Succeeded
    Failed
    Cancelled
    TimedOut
    Stopped

    def self.to_json(e : OperationStatus, json : JSON::Builder) : Nil
      value = case e
              when AL::OperationStatus::Started   then "STARTED"
              when AL::OperationStatus::Pending   then "PENDING"
              when AL::OperationStatus::Ready     then "READY"
              when AL::OperationStatus::Succeeded then "SUCCEEDED"
              when AL::OperationStatus::Failed    then "FAILED"
              when AL::OperationStatus::Cancelled then "CANCELLED"
              when AL::OperationStatus::TimedOut  then "TIMED_OUT"
              when AL::OperationStatus::Stopped   then "STOPPED"
              else
                raise Exception.new("unknown enum value for 'OperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::OperationStatus
      value = pull.read_string
      case value
      when "STARTED"   then AL::OperationStatus::Started
      when "PENDING"   then AL::OperationStatus::Pending
      when "READY"     then AL::OperationStatus::Ready
      when "SUCCEEDED" then AL::OperationStatus::Succeeded
      when "FAILED"    then AL::OperationStatus::Failed
      when "CANCELLED" then AL::OperationStatus::Cancelled
      when "TIMED_OUT" then AL::OperationStatus::TimedOut
      when "STOPPED"   then AL::OperationStatus::Stopped
      else
        raise Exception.new("unknown enum value for 'OperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::OperationStatus::Started   then "STARTED"
      when AL::OperationStatus::Pending   then "PENDING"
      when AL::OperationStatus::Ready     then "READY"
      when AL::OperationStatus::Succeeded then "SUCCEEDED"
      when AL::OperationStatus::Failed    then "FAILED"
      when AL::OperationStatus::Cancelled then "CANCELLED"
      when AL::OperationStatus::TimedOut  then "TIMED_OUT"
      when AL::OperationStatus::Stopped   then "STOPPED"
      else
        raise Exception.new("unknown enum value for 'OperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::OperationStatus?
      case key
      when "STARTED"   then AL::OperationStatus::Started
      when "PENDING"   then AL::OperationStatus::Pending
      when "READY"     then AL::OperationStatus::Ready
      when "SUCCEEDED" then AL::OperationStatus::Succeeded
      when "FAILED"    then AL::OperationStatus::Failed
      when "CANCELLED" then AL::OperationStatus::Cancelled
      when "TIMED_OUT" then AL::OperationStatus::TimedOut
      when "STOPPED"   then AL::OperationStatus::Stopped
      else
        nil
      end
    end
  end
end
