private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FpgaImageStateCode
    Pending
    Failed
    Available
    Unavailable

    def self.to_json(e : FpgaImageStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FpgaImageStateCode::Pending     then "pending"
              when AEC::FpgaImageStateCode::Failed      then "failed"
              when AEC::FpgaImageStateCode::Available   then "available"
              when AEC::FpgaImageStateCode::Unavailable then "unavailable"
              else
                raise Exception.new("unknown enum value for 'FpgaImageStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FpgaImageStateCode
      value = pull.read_string
      case value
      when "pending"     then AEC::FpgaImageStateCode::Pending
      when "failed"      then AEC::FpgaImageStateCode::Failed
      when "available"   then AEC::FpgaImageStateCode::Available
      when "unavailable" then AEC::FpgaImageStateCode::Unavailable
      else
        raise Exception.new("unknown enum value for 'FpgaImageStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FpgaImageStateCode::Pending     then "pending"
      when AEC::FpgaImageStateCode::Failed      then "failed"
      when AEC::FpgaImageStateCode::Available   then "available"
      when AEC::FpgaImageStateCode::Unavailable then "unavailable"
      else
        raise Exception.new("unknown enum value for 'FpgaImageStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FpgaImageStateCode?
      case key
      when "pending"     then AEC::FpgaImageStateCode::Pending
      when "failed"      then AEC::FpgaImageStateCode::Failed
      when "available"   then AEC::FpgaImageStateCode::Available
      when "unavailable" then AEC::FpgaImageStateCode::Unavailable
      else
        nil
      end
    end
  end
end
