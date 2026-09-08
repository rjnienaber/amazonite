private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ListingState
    Available
    Sold
    Cancelled
    Pending

    def self.to_json(e : ListingState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ListingState::Available then "available"
              when AEC::ListingState::Sold      then "sold"
              when AEC::ListingState::Cancelled then "cancelled"
              when AEC::ListingState::Pending   then "pending"
              else
                raise Exception.new("unknown enum value for 'ListingState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ListingState
      value = pull.read_string
      case value
      when "available" then AEC::ListingState::Available
      when "sold"      then AEC::ListingState::Sold
      when "cancelled" then AEC::ListingState::Cancelled
      when "pending"   then AEC::ListingState::Pending
      else
        raise Exception.new("unknown enum value for 'ListingState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ListingState::Available then "available"
      when AEC::ListingState::Sold      then "sold"
      when AEC::ListingState::Cancelled then "cancelled"
      when AEC::ListingState::Pending   then "pending"
      else
        raise Exception.new("unknown enum value for 'ListingState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ListingState?
      case key
      when "available" then AEC::ListingState::Available
      when "sold"      then AEC::ListingState::Sold
      when "cancelled" then AEC::ListingState::Cancelled
      when "pending"   then AEC::ListingState::Pending
      else
        nil
      end
    end
  end
end
