private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetActivityStatus
    Error
    PendingFulfillment
    PendingTermination
    Fulfilled

    def self.to_json(e : FleetActivityStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetActivityStatus::Error              then "error"
              when AEC::FleetActivityStatus::PendingFulfillment then "pending_fulfillment"
              when AEC::FleetActivityStatus::PendingTermination then "pending_termination"
              when AEC::FleetActivityStatus::Fulfilled          then "fulfilled"
              else
                raise Exception.new("unknown enum value for 'FleetActivityStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetActivityStatus
      value = pull.read_string
      case value
      when "error"               then AEC::FleetActivityStatus::Error
      when "pending_fulfillment" then AEC::FleetActivityStatus::PendingFulfillment
      when "pending_termination" then AEC::FleetActivityStatus::PendingTermination
      when "fulfilled"           then AEC::FleetActivityStatus::Fulfilled
      else
        raise Exception.new("unknown enum value for 'FleetActivityStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetActivityStatus::Error              then "error"
      when AEC::FleetActivityStatus::PendingFulfillment then "pending_fulfillment"
      when AEC::FleetActivityStatus::PendingTermination then "pending_termination"
      when AEC::FleetActivityStatus::Fulfilled          then "fulfilled"
      else
        raise Exception.new("unknown enum value for 'FleetActivityStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetActivityStatus?
      case key
      when "error"               then AEC::FleetActivityStatus::Error
      when "pending_fulfillment" then AEC::FleetActivityStatus::PendingFulfillment
      when "pending_termination" then AEC::FleetActivityStatus::PendingTermination
      when "fulfilled"           then AEC::FleetActivityStatus::Fulfilled
      else
        nil
      end
    end
  end
end
