private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ConnectivityType
    Private
    Public

    def self.to_json(e : ConnectivityType, json : JSON::Builder) : Nil
      value = case e
              when AEC::ConnectivityType::Private then "private"
              when AEC::ConnectivityType::Public  then "public"
              else
                raise Exception.new("unknown enum value for 'ConnectivityType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ConnectivityType
      value = pull.read_string
      case value
      when "private" then AEC::ConnectivityType::Private
      when "public"  then AEC::ConnectivityType::Public
      else
        raise Exception.new("unknown enum value for 'ConnectivityType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ConnectivityType::Private then "private"
      when AEC::ConnectivityType::Public  then "public"
      else
        raise Exception.new("unknown enum value for 'ConnectivityType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ConnectivityType?
      case key
      when "private" then AEC::ConnectivityType::Private
      when "public"  then AEC::ConnectivityType::Public
      else
        nil
      end
    end
  end
end
