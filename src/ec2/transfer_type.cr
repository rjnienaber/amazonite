private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TransferType
    TimeBased
    Standard

    def self.to_json(e : TransferType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TransferType::TimeBased then "time-based"
              when AEC::TransferType::Standard  then "standard"
              else
                raise Exception.new("unknown enum value for 'TransferType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TransferType
      value = pull.read_string
      case value
      when "time-based" then AEC::TransferType::TimeBased
      when "standard"   then AEC::TransferType::Standard
      else
        raise Exception.new("unknown enum value for 'TransferType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TransferType::TimeBased then "time-based"
      when AEC::TransferType::Standard  then "standard"
      else
        raise Exception.new("unknown enum value for 'TransferType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TransferType?
      case key
      when "time-based" then AEC::TransferType::TimeBased
      when "standard"   then AEC::TransferType::Standard
      else
        nil
      end
    end
  end
end
