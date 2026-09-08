private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CapacityReservationBillingRequestStatus
    Pending
    Accepted
    Rejected
    Cancelled
    Revoked
    Expired

    def self.to_json(e : CapacityReservationBillingRequestStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::CapacityReservationBillingRequestStatus::Pending   then "pending"
              when AEC::CapacityReservationBillingRequestStatus::Accepted  then "accepted"
              when AEC::CapacityReservationBillingRequestStatus::Rejected  then "rejected"
              when AEC::CapacityReservationBillingRequestStatus::Cancelled then "cancelled"
              when AEC::CapacityReservationBillingRequestStatus::Revoked   then "revoked"
              when AEC::CapacityReservationBillingRequestStatus::Expired   then "expired"
              else
                raise Exception.new("unknown enum value for 'CapacityReservationBillingRequestStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CapacityReservationBillingRequestStatus
      value = pull.read_string
      case value
      when "pending"   then AEC::CapacityReservationBillingRequestStatus::Pending
      when "accepted"  then AEC::CapacityReservationBillingRequestStatus::Accepted
      when "rejected"  then AEC::CapacityReservationBillingRequestStatus::Rejected
      when "cancelled" then AEC::CapacityReservationBillingRequestStatus::Cancelled
      when "revoked"   then AEC::CapacityReservationBillingRequestStatus::Revoked
      when "expired"   then AEC::CapacityReservationBillingRequestStatus::Expired
      else
        raise Exception.new("unknown enum value for 'CapacityReservationBillingRequestStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CapacityReservationBillingRequestStatus::Pending   then "pending"
      when AEC::CapacityReservationBillingRequestStatus::Accepted  then "accepted"
      when AEC::CapacityReservationBillingRequestStatus::Rejected  then "rejected"
      when AEC::CapacityReservationBillingRequestStatus::Cancelled then "cancelled"
      when AEC::CapacityReservationBillingRequestStatus::Revoked   then "revoked"
      when AEC::CapacityReservationBillingRequestStatus::Expired   then "expired"
      else
        raise Exception.new("unknown enum value for 'CapacityReservationBillingRequestStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CapacityReservationBillingRequestStatus?
      case key
      when "pending"   then AEC::CapacityReservationBillingRequestStatus::Pending
      when "accepted"  then AEC::CapacityReservationBillingRequestStatus::Accepted
      when "rejected"  then AEC::CapacityReservationBillingRequestStatus::Rejected
      when "cancelled" then AEC::CapacityReservationBillingRequestStatus::Cancelled
      when "revoked"   then AEC::CapacityReservationBillingRequestStatus::Revoked
      when "expired"   then AEC::CapacityReservationBillingRequestStatus::Expired
      else
        nil
      end
    end
  end
end
