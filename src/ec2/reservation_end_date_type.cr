private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReservationEndDateType
    Limited
    Unlimited

    def self.to_json(e : ReservationEndDateType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReservationEndDateType::Limited   then "limited"
              when AEC::ReservationEndDateType::Unlimited then "unlimited"
              else
                raise Exception.new("unknown enum value for 'ReservationEndDateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReservationEndDateType
      value = pull.read_string
      case value
      when "limited"   then AEC::ReservationEndDateType::Limited
      when "unlimited" then AEC::ReservationEndDateType::Unlimited
      else
        raise Exception.new("unknown enum value for 'ReservationEndDateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReservationEndDateType::Limited   then "limited"
      when AEC::ReservationEndDateType::Unlimited then "unlimited"
      else
        raise Exception.new("unknown enum value for 'ReservationEndDateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReservationEndDateType?
      case key
      when "limited"   then AEC::ReservationEndDateType::Limited
      when "unlimited" then AEC::ReservationEndDateType::Unlimited
      else
        nil
      end
    end
  end
end
