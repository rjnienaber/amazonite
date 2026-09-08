private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ProductCodeValues
    Devpay
    Marketplace

    def self.to_json(e : ProductCodeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::ProductCodeValues::Devpay      then "devpay"
              when AEC::ProductCodeValues::Marketplace then "marketplace"
              else
                raise Exception.new("unknown enum value for 'ProductCodeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ProductCodeValues
      value = pull.read_string
      case value
      when "devpay"      then AEC::ProductCodeValues::Devpay
      when "marketplace" then AEC::ProductCodeValues::Marketplace
      else
        raise Exception.new("unknown enum value for 'ProductCodeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ProductCodeValues::Devpay      then "devpay"
      when AEC::ProductCodeValues::Marketplace then "marketplace"
      else
        raise Exception.new("unknown enum value for 'ProductCodeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ProductCodeValues?
      case key
      when "devpay"      then AEC::ProductCodeValues::Devpay
      when "marketplace" then AEC::ProductCodeValues::Marketplace
      else
        nil
      end
    end
  end
end
