private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
  enum IncludeDetail
    None
    Full

    def self.to_json(e : IncludeDetail, json : JSON::Builder) : Nil
      value = case e
              when AEB::IncludeDetail::None then "NONE"
              when AEB::IncludeDetail::Full then "FULL"
              else
                raise Exception.new("unknown enum value for 'IncludeDetail' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::IncludeDetail
      value = pull.read_string
      case value
      when "NONE" then AEB::IncludeDetail::None
      when "FULL" then AEB::IncludeDetail::Full
      else
        raise Exception.new("unknown enum value for 'IncludeDetail' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::IncludeDetail::None then "NONE"
      when AEB::IncludeDetail::Full then "FULL"
      else
        raise Exception.new("unknown enum value for 'IncludeDetail' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::IncludeDetail?
      case key
      when "NONE" then AEB::IncludeDetail::None
      when "FULL" then AEB::IncludeDetail::Full
      else
        nil
      end
    end
  end
end
