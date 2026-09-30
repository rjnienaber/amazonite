private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PaymentOption
    AllUpfront
    PartialUpfront
    NoUpfront

    def self.to_json(e : PaymentOption, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PaymentOption
      value = pull.read_string
      case value
      when "AllUpfront"     then AEC::PaymentOption::AllUpfront
      when "PartialUpfront" then AEC::PaymentOption::PartialUpfront
      when "NoUpfront"      then AEC::PaymentOption::NoUpfront
      else
        raise Exception.new("unknown enum value for 'PaymentOption' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::PaymentOption?
      case key
      when "AllUpfront"     then AEC::PaymentOption::AllUpfront
      when "PartialUpfront" then AEC::PaymentOption::PartialUpfront
      when "NoUpfront"      then AEC::PaymentOption::NoUpfront
      else
        nil
      end
    end
  end
end
