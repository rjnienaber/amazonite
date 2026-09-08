private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationCancellationQuoteState
    Pending
    Active
    Expired

    def self.to_json(e : CapacityReservationCancellationQuoteState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationCancellationQuoteState::Pending then "pending"
              when AEC::CapacityReservationCancellationQuoteState::Active  then "active"
              when AEC::CapacityReservationCancellationQuoteState::Expired then "expired"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationCancellationQuoteState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationCancellationQuoteState
      value = pull.read_string
      case value
      when "pending" then AEC::CapacityReservationCancellationQuoteState::Pending
      when "active"  then AEC::CapacityReservationCancellationQuoteState::Active
      when "expired" then AEC::CapacityReservationCancellationQuoteState::Expired
      else
        raise Exception.new("unknown enum value for 'CapacityReservationCancellationQuoteState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationCancellationQuoteState::Pending then "pending"
      when AEC::CapacityReservationCancellationQuoteState::Active  then "active"
      when AEC::CapacityReservationCancellationQuoteState::Expired then "expired"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationCancellationQuoteState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationCancellationQuoteState?
      case key
      when "pending" then AEC::CapacityReservationCancellationQuoteState::Pending
      when "active"  then AEC::CapacityReservationCancellationQuoteState::Active
      when "expired" then AEC::CapacityReservationCancellationQuoteState::Expired
      else
        nil
      end
    end
  end
end
