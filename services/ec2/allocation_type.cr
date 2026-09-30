private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllocationType
    Used
    Future
    Cancelling

    def self.to_json(e : AllocationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllocationType::Used       then "used"
              when AEC::AllocationType::Future     then "future"
              when AEC::AllocationType::Cancelling then "cancelling"
              else
                raise Exception.new("unknown enum value for 'AllocationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllocationType
      value = pull.read_string
      case value
      when "used"       then AEC::AllocationType::Used
      when "future"     then AEC::AllocationType::Future
      when "cancelling" then AEC::AllocationType::Cancelling
      else
        raise Exception.new("unknown enum value for 'AllocationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllocationType::Used       then "used"
      when AEC::AllocationType::Future     then "future"
      when AEC::AllocationType::Cancelling then "cancelling"
      else
        raise Exception.new("unknown enum value for 'AllocationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllocationType?
      case key
      when "used"       then AEC::AllocationType::Used
      when "future"     then AEC::AllocationType::Future
      when "cancelling" then AEC::AllocationType::Cancelling
      else
        nil
      end
    end
  end
end
