private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CallerRole
    OdcrOwner
    UnusedReservationBillingOwner

    def self.to_json(e : CallerRole, json : JSON::Builder) : Nil
      value = case e
              when AEC::CallerRole::OdcrOwner                     then "odcr-owner"
              when AEC::CallerRole::UnusedReservationBillingOwner then "unused-reservation-billing-owner"
              else
                raise Exception.new("unknown enum value for 'CallerRole' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CallerRole
      value = pull.read_string
      case value
      when "odcr-owner"                       then AEC::CallerRole::OdcrOwner
      when "unused-reservation-billing-owner" then AEC::CallerRole::UnusedReservationBillingOwner
      else
        raise Exception.new("unknown enum value for 'CallerRole' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CallerRole::OdcrOwner                     then "odcr-owner"
      when AEC::CallerRole::UnusedReservationBillingOwner then "unused-reservation-billing-owner"
      else
        raise Exception.new("unknown enum value for 'CallerRole' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CallerRole?
      case key
      when "odcr-owner"                       then AEC::CallerRole::OdcrOwner
      when "unused-reservation-billing-owner" then AEC::CallerRole::UnusedReservationBillingOwner
      else
        nil
      end
    end
  end
end
