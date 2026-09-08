private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum UnlimitedSupportedInstanceFamily
    T2
    T3
    T3a
    T4g

    def self.to_json(e : UnlimitedSupportedInstanceFamily, json : JSON::Builder) : Nil
      value = case e
              when AEC::UnlimitedSupportedInstanceFamily::T2  then "t2"
              when AEC::UnlimitedSupportedInstanceFamily::T3  then "t3"
              when AEC::UnlimitedSupportedInstanceFamily::T3a then "t3a"
              when AEC::UnlimitedSupportedInstanceFamily::T4g then "t4g"
              else
                raise Exception.new("unknown enum value for 'UnlimitedSupportedInstanceFamily' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::UnlimitedSupportedInstanceFamily
      value = pull.read_string
      case value
      when "t2"  then AEC::UnlimitedSupportedInstanceFamily::T2
      when "t3"  then AEC::UnlimitedSupportedInstanceFamily::T3
      when "t3a" then AEC::UnlimitedSupportedInstanceFamily::T3a
      when "t4g" then AEC::UnlimitedSupportedInstanceFamily::T4g
      else
        raise Exception.new("unknown enum value for 'UnlimitedSupportedInstanceFamily' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::UnlimitedSupportedInstanceFamily::T2  then "t2"
      when AEC::UnlimitedSupportedInstanceFamily::T3  then "t3"
      when AEC::UnlimitedSupportedInstanceFamily::T3a then "t3a"
      when AEC::UnlimitedSupportedInstanceFamily::T4g then "t4g"
      else
        raise Exception.new("unknown enum value for 'UnlimitedSupportedInstanceFamily' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::UnlimitedSupportedInstanceFamily?
      case key
      when "t2"  then AEC::UnlimitedSupportedInstanceFamily::T2
      when "t3"  then AEC::UnlimitedSupportedInstanceFamily::T3
      when "t3a" then AEC::UnlimitedSupportedInstanceFamily::T3a
      when "t4g" then AEC::UnlimitedSupportedInstanceFamily::T4g
      else
        nil
      end
    end
  end
end
