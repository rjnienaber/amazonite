private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PayerResponsibility
    ServiceOwner

    def self.to_json(e : PayerResponsibility, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PayerResponsibility
      value = pull.read_string
      case value
      when "ServiceOwner" then AEC::PayerResponsibility::ServiceOwner
      else
        raise Exception.new("unknown enum value for 'PayerResponsibility' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::PayerResponsibility?
      case key
      when "ServiceOwner" then AEC::PayerResponsibility::ServiceOwner
      else
        nil
      end
    end
  end
end
