private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CancelSpotInstanceRequestState
    Active
    Open
    Closed
    Cancelled
    Completed

    def self.to_json(e : CancelSpotInstanceRequestState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CancelSpotInstanceRequestState::Active    then "active"
              when AEC::CancelSpotInstanceRequestState::Open      then "open"
              when AEC::CancelSpotInstanceRequestState::Closed    then "closed"
              when AEC::CancelSpotInstanceRequestState::Cancelled then "cancelled"
              when AEC::CancelSpotInstanceRequestState::Completed then "completed"
              else
                raise Exception.new("unknown enum value for 'CancelSpotInstanceRequestState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CancelSpotInstanceRequestState
      value = pull.read_string
      case value
      when "active"    then AEC::CancelSpotInstanceRequestState::Active
      when "open"      then AEC::CancelSpotInstanceRequestState::Open
      when "closed"    then AEC::CancelSpotInstanceRequestState::Closed
      when "cancelled" then AEC::CancelSpotInstanceRequestState::Cancelled
      when "completed" then AEC::CancelSpotInstanceRequestState::Completed
      else
        raise Exception.new("unknown enum value for 'CancelSpotInstanceRequestState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CancelSpotInstanceRequestState::Active    then "active"
      when AEC::CancelSpotInstanceRequestState::Open      then "open"
      when AEC::CancelSpotInstanceRequestState::Closed    then "closed"
      when AEC::CancelSpotInstanceRequestState::Cancelled then "cancelled"
      when AEC::CancelSpotInstanceRequestState::Completed then "completed"
      else
        raise Exception.new("unknown enum value for 'CancelSpotInstanceRequestState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CancelSpotInstanceRequestState?
      case key
      when "active"    then AEC::CancelSpotInstanceRequestState::Active
      when "open"      then AEC::CancelSpotInstanceRequestState::Open
      when "closed"    then AEC::CancelSpotInstanceRequestState::Closed
      when "cancelled" then AEC::CancelSpotInstanceRequestState::Cancelled
      when "completed" then AEC::CancelSpotInstanceRequestState::Completed
      else
        nil
      end
    end
  end
end
