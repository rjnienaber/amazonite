private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationModificationQuoteState
    Active
    Expired

    def self.to_json(e : CapacityReservationModificationQuoteState, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationModificationQuoteState::Active  then "active"
              when AEC::CapacityReservationModificationQuoteState::Expired then "expired"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationModificationQuoteState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationModificationQuoteState
      value = pull.read_string
      case value
      when "active"  then AEC::CapacityReservationModificationQuoteState::Active
      when "expired" then AEC::CapacityReservationModificationQuoteState::Expired
      else
        raise Exception.new("unknown enum value for 'CapacityReservationModificationQuoteState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationModificationQuoteState::Active  then "active"
      when AEC::CapacityReservationModificationQuoteState::Expired then "expired"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationModificationQuoteState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationModificationQuoteState?
      case key
      when "active"  then AEC::CapacityReservationModificationQuoteState::Active
      when "expired" then AEC::CapacityReservationModificationQuoteState::Expired
      else
        nil
      end
    end
  end
end
