private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ActivityStatus
    Error
    PendingFulfillment
    PendingTermination
    Fulfilled

    def self.to_json(e : ActivityStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::ActivityStatus::Error              then "error"
              when AEC::ActivityStatus::PendingFulfillment then "pending_fulfillment"
              when AEC::ActivityStatus::PendingTermination then "pending_termination"
              when AEC::ActivityStatus::Fulfilled          then "fulfilled"
              else
                raise Exception.new("unknown enum value for 'ActivityStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ActivityStatus
      value = pull.read_string
      case value
      when "error"               then AEC::ActivityStatus::Error
      when "pending_fulfillment" then AEC::ActivityStatus::PendingFulfillment
      when "pending_termination" then AEC::ActivityStatus::PendingTermination
      when "fulfilled"           then AEC::ActivityStatus::Fulfilled
      else
        raise Exception.new("unknown enum value for 'ActivityStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ActivityStatus::Error              then "error"
      when AEC::ActivityStatus::PendingFulfillment then "pending_fulfillment"
      when AEC::ActivityStatus::PendingTermination then "pending_termination"
      when AEC::ActivityStatus::Fulfilled          then "fulfilled"
      else
        raise Exception.new("unknown enum value for 'ActivityStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ActivityStatus?
      case key
      when "error"               then AEC::ActivityStatus::Error
      when "pending_fulfillment" then AEC::ActivityStatus::PendingFulfillment
      when "pending_termination" then AEC::ActivityStatus::PendingTermination
      when "fulfilled"           then AEC::ActivityStatus::Fulfilled
      else
        nil
      end
    end
  end
end
