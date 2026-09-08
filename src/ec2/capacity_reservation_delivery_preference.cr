private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationDeliveryPreference
    Fixed
    Incremental

    def self.to_json(e : CapacityReservationDeliveryPreference, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationDeliveryPreference::Fixed       then "fixed"
              when AEC::CapacityReservationDeliveryPreference::Incremental then "incremental"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationDeliveryPreference' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationDeliveryPreference
      value = pull.read_string
      case value
      when "fixed"       then AEC::CapacityReservationDeliveryPreference::Fixed
      when "incremental" then AEC::CapacityReservationDeliveryPreference::Incremental
      else
        raise Exception.new("unknown enum value for 'CapacityReservationDeliveryPreference' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationDeliveryPreference::Fixed       then "fixed"
      when AEC::CapacityReservationDeliveryPreference::Incremental then "incremental"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationDeliveryPreference' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationDeliveryPreference?
      case key
      when "fixed"       then AEC::CapacityReservationDeliveryPreference::Fixed
      when "incremental" then AEC::CapacityReservationDeliveryPreference::Incremental
      else
        nil
      end
    end
  end
end
