private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CurrencyCodeValues
    Usd

    def self.to_json(e : CurrencyCodeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::CurrencyCodeValues::Usd then "USD"
              else
                raise Exception.new("unknown enum value for 'CurrencyCodeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CurrencyCodeValues
      value = pull.read_string
      case value
      when "USD" then AEC::CurrencyCodeValues::Usd
      else
        raise Exception.new("unknown enum value for 'CurrencyCodeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CurrencyCodeValues::Usd then "USD"
      else
        raise Exception.new("unknown enum value for 'CurrencyCodeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CurrencyCodeValues?
      case key
      when "USD" then AEC::CurrencyCodeValues::Usd
      else
        nil
      end
    end
  end
end
