private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ListingStatus
    Active
    Pending
    Cancelled
    Closed

    def self.to_json(e : ListingStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::ListingStatus::Active    then "active"
              when AEC::ListingStatus::Pending   then "pending"
              when AEC::ListingStatus::Cancelled then "cancelled"
              when AEC::ListingStatus::Closed    then "closed"
              else
                raise Exception.new("unknown enum value for 'ListingStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ListingStatus
      value = pull.read_string
      case value
      when "active"    then AEC::ListingStatus::Active
      when "pending"   then AEC::ListingStatus::Pending
      when "cancelled" then AEC::ListingStatus::Cancelled
      when "closed"    then AEC::ListingStatus::Closed
      else
        raise Exception.new("unknown enum value for 'ListingStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ListingStatus::Active    then "active"
      when AEC::ListingStatus::Pending   then "pending"
      when AEC::ListingStatus::Cancelled then "cancelled"
      when AEC::ListingStatus::Closed    then "closed"
      else
        raise Exception.new("unknown enum value for 'ListingStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ListingStatus?
      case key
      when "active"    then AEC::ListingStatus::Active
      when "pending"   then AEC::ListingStatus::Pending
      when "cancelled" then AEC::ListingStatus::Cancelled
      when "closed"    then AEC::ListingStatus::Closed
      else
        nil
      end
    end
  end
end
